#This code is done, considering the input is in Channel 1 and the Output is in Channel 4


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import math
import os
import glob
from scipy.interpolate import pchip

def rect_to_polar(z):  # enter rectangular form and returns polar form in degrees
    a = z.real
    b = z.imag
    r = math.hypot(a, b)
    theta = math.atan2(b, a) * 180 / math.pi
    return r, theta


def polar_to_rect(z, theta):  # enter polar form and returns rectangular form
    rect = z * np.exp(1j * theta * math.pi / 180)
    decimal_places = 3
    return round(rect.real, decimal_places) + round(rect.imag, decimal_places) * 1j


def read_csv(CSV_NAME="wave_form_data.csv"):
    colnames = ['xaxis', 'V1', 'V2', 'V3', 'V4', 'I1', 'I2', 'I3', 'I4', 'P1', 'P2', 'P3', 'P4']
    data = pd.read_csv(CSV_NAME, names=colnames)

    V1 = data.V1.tolist()
    V2 = data.V2.tolist()
    V3 = data.V3.tolist()
    V4 = data.V4.tolist()
    I1 = data.I1.tolist()
    I2 = data.I2.tolist()
    I3 = data.I3.tolist()
    I4 = data.I4.tolist()
    xaxis = data.xaxis.tolist()

    V1 = np.array(V1[2:], dtype=np.float32)
    V2 = np.array(V2[2:], dtype=np.float32)
    V3 = np.array(V3[2:], dtype=np.float32)
    V4 = np.array(V4[2:], dtype=np.float32)
    I1 = np.array(I1[2:], dtype=np.float32)
    I2 = np.array(I2[2:], dtype=np.float32)
    I3 = np.array(I3[2:], dtype=np.float32)
    I4 = np.array(I4[2:], dtype=np.float32)
    xaxis = np.array(xaxis[2:], dtype=np.float32)

    return xaxis, V1, V2, V3, V4, I1, I2, I3, I4


def calculate_fft(xaxis, signal):
    n = len(signal)  # length of the signal
    Fs = 1 / (float("%.5f" % (-xaxis[0] * 2)) / n)  # sample frequency
    Ts = (-xaxis[0] * 2) / Fs  # sample interval
    t = np.arange(0, -xaxis[0] * 2, Ts)  # time vector
    k = np.arange(n)
    T = n / Fs  # period of signal
    frq = k / T  # two sides frequency range
    frq = frq[range(n / 2)]  # one side frequency range
    f = int(60 * T);  # frequency of the signal 1
    Y = np.fft.fft(signal) / (n / 2)  # fft computing and normalization
    Y = Y[range(n / 2)]

    # fig, ax = plt.subplots(2, 1)
    # ax[0].plot(t,signal)
    # ax[0].set_xlabel('Time')
    # ax[0].set_ylabel('Amplitude')
    # ax[0].grid()
    # ax[1].plot(frq,abs(Y),'r') # plotting the spectrum
    # ax[1].set_xlabel('Freq (Hz)')
    # ax[1].set_ylabel('|Y(freq)|')
    # ax[1].grid()

    fundamental_amp = abs(Y[f]) / math.sqrt(2)  # in RMS
    fundamental_angle = np.angle(Y[f]) * (180 / np.pi) + 90

    harmonics_amps, harmonics_angles = find_harmonics_amps_and_angles(Y)
    return harmonics_amps, harmonics_angles


def find_harmonics_amps_and_angles(fft):
    harmonics_amps = []
    harmonics_angles = []
    reconstructed_signal = 0
    index = 0
    xaxis = np.linspace(0, 1, 2400)
    for i in fft:
        amp, angle = rect_to_polar(i)
        harmonics_amps.append(amp)
        harmonics_angles.append(angle + 90)
        reconstructed_signal += amp * np.sin(2 * np.pi * index * xaxis + (angle + 90) * np.pi / 180)
        index += 1
        # print(amp,(angle))

    fundamental_amp = harmonics_amps[60]
    fundamental_angle = harmonics_angles[60]
    return harmonics_amps, harmonics_angles


def plot_fundamental_signal(amp, angle, harmonic):
    n_points = 10000
    x = np.linspace(0, 1, n_points)
    y = amp * np.sin(2 * np.pi * harmonic * x + angle * np.pi / 180)
    # plt.figure(3)
    # plt.plot(x,y)
    return y


def calculate_time_series_rms(signal):
    rms = np.sqrt(np.mean(signal ** 2))
    return rms


def calculate_dc_component(signal):
    dc_component = np.mean(signal)
    return dc_component


def calculate_power(xaxis, V, I):
    v_harmonics_amps, v_harmonics_angles = calculate_fft(xaxis, V)
    i_harmonics_amps, i_harmonics_angles = calculate_fft(xaxis, I)

    active_power = calculate_dc_component(V) * calculate_dc_component(I) #it starts with the DC component
    index = 0
    for j in v_harmonics_amps:
        if index == 0:  # here we are disconsidering when frequency =0, because we already added the dc component above
            index = + 1
            pass
        else:
            theta = (v_harmonics_angles[index] - i_harmonics_angles[index])
            active_power += v_harmonics_amps[index] / np.sqrt(2) * i_harmonics_amps[index] / np.sqrt(2) * np.cos(theta*np.pi/180)
            index += 1

    v_rms = calculate_time_series_rms(V)
    i_rms = calculate_time_series_rms(I)

    apparent_power = i_rms * v_rms
    system_theta = np.arccos(active_power / apparent_power)
    power_factor = active_power / apparent_power
    reactive_power = apparent_power * np.sin(system_theta)

    return active_power, reactive_power, apparent_power, power_factor


def find_csv(path):
    extension = 'csv'
    os.chdir(path)
    result = glob.glob('*.{}'.format(extension))
    increasing_power_list = [k for k in result if 'increasing' in k]
    decreasing_power_list = [k for k in result if 'decreasing' in k]
    random_power_list = [k for k in result if 'random' in k]
    return increasing_power_list, decreasing_power_list, random_power_list

def write_harmonics_csv(path, tests_list):

    fundamental = 60
    test_type = []
    power_step = []
    frequency = []
    harmonic = []
    v_input_harm_amps = []
    v_input_harm_angl = []
    i_input_harm_amps = []
    i_input_harm_angl = []
    v_input_complex = []
    i_input_complex = []
    input_real_power = []

    v_output_harm_amps = []
    v_output_harm_angl = []
    i_output_harm_amps = []
    i_output_harm_angl = []
    v_output_complex = []
    i_output_complex = []
    output_real_power = []
    l = [20 * [i] for i in range(11)]
    power_step = []
    for sublist in l:
        for item in sublist:
            power_step.append(item*10)
    power_step = 3*power_step

    for file in tests_list:

        xaxis, V1, V2, V3, V4, I1, I2, I3, I4 = read_csv(path + "\\" + file)
        v_input_harmonics_amps, v_input_harmonics_angles = calculate_fft(xaxis, V1)
        i_input_harmonics_amps, i_input_harmonics_angles = calculate_fft(xaxis, I1)
        v_output_harmonics_amps, v_output_harmonics_angles = calculate_fft(xaxis, V4)
        i_output_harmonics_amps, i_output_harmonics_angles = calculate_fft(xaxis, I4)

        for i in range(len(v_input_harmonics_amps)):
            if i == 0:  # DC Component
                if 'increasing' in file:
                    test_type.append("Increasing Power")
                elif 'decreasing' in file:
                    test_type.append("Decreasing Power")
                elif 'random' in file:
                    test_type.append("Random Power")

                frequency.append(i)
                harmonic.append(i/60)

                v_input_harm_amps.append(calculate_dc_component(V1))
                v_input_harm_angl.append(0)
                i_input_harm_amps.append(calculate_dc_component(I1))
                i_input_harm_angl.append(0)
                v_input_complex.append(polar_to_rect(v_input_harm_amps[i], v_input_harm_angl[i]))
                i_input_complex.append(polar_to_rect(i_input_harm_amps[i], i_input_harm_angl[i]))
                input_real_power.append(v_input_harm_amps[i] * i_input_harm_amps[i])

                v_output_harm_amps.append(calculate_dc_component(V4))
                v_output_harm_angl.append(0)
                i_output_harm_amps.append(calculate_dc_component(I4))
                i_output_harm_angl.append(0)
                v_output_complex.append(polar_to_rect(v_output_harm_amps[i], v_output_harm_angl[i]))
                i_output_complex.append(polar_to_rect(i_output_harm_amps[i], i_output_harm_angl[i]))
                output_real_power.append(calculate_dc_component(V4) * calculate_dc_component(I4))

            elif (i != 0 and i % fundamental == 0):
                if 'increasing' in file:
                    test_type.append("Increasing Power")
                elif 'decreasing' in file:
                    test_type.append("Decreasing Power")
                elif 'random' in file:
                    test_type.append("Random Power")

                frequency.append(i)
                harmonic.append(i/60)
                v_input_harm_amps.append(v_input_harmonics_amps[i] / np.sqrt(2))
                v_input_harm_angl.append(v_input_harmonics_angles[i])
                i_input_harm_amps.append(i_input_harmonics_amps[i] / np.sqrt(2))
                i_input_harm_angl.append(i_input_harmonics_angles[i])
                v_input_complex.append(polar_to_rect(v_input_harmonics_amps[i], v_input_harmonics_angles[i]))
                i_input_complex.append(polar_to_rect(i_input_harmonics_amps[i], i_input_harmonics_angles[i]))
                input_real_power.append(v_input_harmonics_amps[i] / np.sqrt(2) * i_input_harmonics_amps[i] / np.sqrt(2) *
                                  np.cos((v_input_harmonics_angles[i] - i_input_harmonics_angles[i])*np.pi/180))

                v_output_harm_amps.append(v_output_harmonics_amps[i] / np.sqrt(2))
                v_output_harm_angl.append(v_output_harmonics_angles[i])
                i_output_harm_amps.append(i_output_harmonics_amps[i] / np.sqrt(2))
                i_output_harm_angl.append(i_output_harmonics_angles[i])
                v_output_complex.append(polar_to_rect(v_output_harmonics_amps[i], v_output_harmonics_angles[i]))
                i_output_complex.append(polar_to_rect(i_output_harmonics_amps[i], i_output_harmonics_angles[i]))
                output_real_power.append(v_output_harmonics_amps[i] / np.sqrt(2) * i_output_harmonics_amps[i] / np.sqrt(2) *
                                  np.cos((v_output_harmonics_angles[i] - i_output_harmonics_angles[i])*np.pi/180))


        df = pd.DataFrame(columns=['Test Type', 'Power Step', 'Frequency (Hz)', 'Harmonic',
                                   'Input Voltage Mag (Vrms)', 'Input Voltage Angle (deg)', 'Input Complex Voltage (V)',
                                   'Input Current Mag (Arms)', 'Input Current Angle (deg)', 'Input Complex Current (A)',
                                   'Input Real Power (W)',
                                   'Output Voltage Mag (Vrms)', 'Output Voltage Angle (deg)', 'Output Complex Voltage (V)',
                                   'Output Current Mag (Arms)', 'Output Current Angle (deg)', 'Output Complex Current (A)',
                                   'Output Real Power (W)',
                                   ])
    
    df['Test Type'] = pd.Series(test_type)
    df['Power Step'] = pd.Series(power_step)
    df['Frequency (Hz)'] = pd.Series(frequency)
    df['Harmonic'] = pd.Series(harmonic)
    df['Input Voltage Mag (Vrms)'] = pd.Series(v_input_harm_amps)
    df['Input Voltage Angle (deg)'] = pd.Series(v_input_harm_angl)
    df['Input Complex Voltage (V)'] = pd.Series(v_input_complex)
    df['Input Current Mag (Arms)'] = pd.Series(i_input_harm_amps)
    df['Input Current Angle (deg)'] = pd.Series(i_input_harm_angl)
    df['Input Complex Current (A)'] = pd.Series(i_input_complex)
    df['Input Real Power (W)'] = pd.Series(input_real_power)

    df['Output Voltage Mag (Vrms)'] = pd.Series(v_output_harm_amps)
    df['Output Voltage Angle (deg)'] = pd.Series(v_output_harm_angl)
    df['Output Complex Voltage (V)'] = pd.Series(v_output_complex)
    df['Output Current Mag (Arms)'] = pd.Series(i_output_harm_amps)
    df['Output Current Angle (deg)'] = pd.Series(i_output_harm_angl)
    df['Output Complex Current (A)'] = pd.Series(i_output_complex)
    df['Output Real Power (W)'] = pd.Series(output_real_power)

    new_path = path + "\\Processed Data"
    if not os.path.exists(new_path):
        os.makedirs(new_path)

    df.to_csv(new_path + "\\Harmonics.csv", index=False)


def plot_harmonics(path):
    title = path.split("\\")[-1]

    new_path = path + "\\Processed Data\\Figures"
    if not os.path.exists(new_path):
        os.makedirs(new_path)

    df = pd.read_csv(path + "\\Processed Data\Harmonics.csv")
    test_type = df['Test Type']
    power_step = df['Power Step']
    frequency = df['Frequency (Hz)']
    input_voltage_mag_rms = df['Input Voltage Mag (Vrms)']
    input_voltage_ang = df['Input Voltage Angle (deg)']
    input_current_mag_rms = df['Input Current Mag (Arms)']
    input_current_ang = df['Input Current Angle (deg)']
    output_voltage_mag_rms = df['Output Voltage Mag (Vrms)']
    output_voltage_ang = df['Output Voltage Angle (deg)']
    output_current_mag_rms = df['Output Current Mag (Arms)']
    output_current_ang = df['Output Current Angle (deg)']

    for j in range(33):
        fig, ax = plt.subplots(2, 1)
        ax[0].set_title(title + "\n" + test_type[j * 20] + " - " + "Power Step " + str(
            power_step[j * 20]) + "% - Input Voltage FFT")
        ax[0].stem(frequency[j * 20:(j + 1) * 20], [i for i in input_voltage_mag_rms[j * 20:(j + 1) * 20]])
        ax[0].set_ylabel("Voltage (V rms)")
        ax[0].grid()
        ax[1].stem(frequency[j * 20:(j + 1) * 20], [i for i in input_voltage_ang[j * 20:(j + 1) * 20]])
        ax[1].set_ylabel("Voltage Angle (Deg)")
        ax[1].set_xlabel("Frequency (Hz)")
        ax[1].grid()
        plt.savefig(new_path + "\\" + test_type[j * 20] + " - " + "Power Step " + str(
            power_step[j * 20]) + "% - Input Voltage FFT")

        fig, bx = plt.subplots(2, 1)
        bx[0].set_title(title + "\n" + test_type[j * 20] + " - " + "Power Step " + str(
            power_step[j * 20]) + "% - Output Voltage FFT")
        bx[0].stem(frequency[j * 20:(j + 1) * 20], [i for i in output_voltage_mag_rms[j * 20:(j + 1) * 20]])
        bx[0].set_ylabel("Voltage (V rms)")
        bx[0].grid()
        bx[1].stem(frequency[j * 20:(j + 1) * 20], [i for i in output_voltage_ang[j * 20:(j + 1) * 20]])
        bx[1].set_ylabel("Voltage Angle (Deg)")
        bx[1].set_xlabel("Frequency (Hz)")
        bx[1].grid()
        plt.savefig(new_path + "\\" + test_type[j * 20] + " - " + "Power Step " + str(
            power_step[j * 20]) + "% - Output Voltage FFT")

        fig, cx = plt.subplots(2, 1)
        cx[0].set_title(title + "\n" + test_type[j * 20] + " - " + "Power Step " + str(
            power_step[j * 20]) + "% - Input Current FFT")
        cx[0].stem(frequency[j * 20:(j + 1) * 20], [i for i in input_current_mag_rms[j * 20:(j + 1) * 20]])
        cx[0].set_ylabel("Current (A rms)")
        cx[0].grid()
        cx[1].stem(frequency[j * 20:(j + 1) * 20], [i for i in input_current_ang[j * 20:(j + 1) * 20]])
        cx[1].set_ylabel("Current Angle (Deg)")
        cx[1].set_xlabel("Frequency (Hz)")
        cx[1].grid()
        plt.savefig(new_path + "\\" + test_type[j * 20] + " - " + "Power Step " + str(
            power_step[j * 20]) + "% - Input Current FFT")

        fig, dx = plt.subplots(2, 1)
        dx[0].set_title(title + "\n" + test_type[j * 20] + " - " + "Power Step " + str(
            power_step[j * 20]) + "% - Output Current FFT")
        dx[0].stem(frequency[j * 20:(j + 1) * 20], [i for i in output_current_mag_rms[j * 20:(j + 1) * 20]])
        dx[0].set_ylabel("Current (A rms)")
        dx[0].grid()
        dx[1].stem(frequency[j * 20:(j + 1) * 20], [i for i in output_current_ang[j * 20:(j + 1) * 20]])
        dx[1].set_ylabel("Current Angle (Deg)")
        dx[1].set_xlabel("Frequency (Hz)")
        dx[1].grid()
        plt.savefig(new_path + "\\" + test_type[j * 20] + " - " + "Power Step " + str(
            power_step[j * 20]) + "% - Output Current FFT")
        plt.close('all')

def calculate_thd(harm_amps):
    fund_mult_amps_list =[] #to store only the amplitudes of the fundamental multiples
    for i in range(len(harm_amps)):
        if i == 0:
            fund_mult_amps_list.append(harm_amps[i])
        elif (i != 0 and i % 60 == 0):
            fund_mult_amps_list.append(harm_amps[i])
    rms_list = [i / np.sqrt(2) for i in fund_mult_amps_list]
    harm = rms_list[2:]
    num = 0
    for i in harm:
        num = i ** 2 + num
    thd = (np.sqrt(num) / rms_list[1]) * 100
    return thd


def write_power_files_csv(path, tests_list):
    df = pd.DataFrame(columns=['Test Type', 'Power Step (%)', 'Input Voltage RMS (V)', 'Input Current RMS (A)',
                               'Input Active Power (W)', 'Input Reactive Power (Var)',
                               'Input Apparent Power (VA)', 'Input (Total) Power Factor',
                               'Input THDV (%)', 'Input THDI (%)',
                               'Output Voltage RMS (V)', 'Output Current RMS (A)', 'Output Active Power (W)',
                               'Output Reactive Power (Var)', 'Output Apparent Power (VA)',
                               'Output (Total) Power Factor',
                               'Output THDV (%)', 'Output THDI (%)',
                               'Efficiency (%)'
                               ])

    processed_path = path + "\\Processed Data"
    if not os.path.exists(processed_path):
        os.makedirs(processed_path)
    df.to_csv(processed_path + "\\Power_data.csv", index=False)
    power_step = [i * 10 for i in 3 * (range(11))] #because there are 3*11 files (10 power steps + 0 power)
    power_step_index = 0
    output_power_list = []
    efficiency_list = []

    for file in tests_list:
        test_type = []
        if 'increasing' in file:
            test_type.append("Increasing Power")
        elif 'decreasing' in file:
            test_type.append("Decreasing Power")
        elif 'random' in file:
            test_type.append("Random Power")

        xaxis, V1, V2, V3, V4, I1, I2, I3, I4 = read_csv(path + "\\" + file)
        input_v_harmonics_amps, input_v_harmonics_angles = calculate_fft(xaxis, V1)
        input_i_harmonics_amps, input_i_harmonics_angles = calculate_fft(xaxis, I1)

        output_v_harmonics_amps, output_v_harmonics_angles = calculate_fft(xaxis, V4)
        output_i_harmonics_amps, output_i_harmonics_angles = calculate_fft(xaxis, I4)

        input_active_power, input_reactive_power, input_apparent_power, input_power_factor = calculate_power(xaxis, V1, I1)
        input_v_rms = calculate_time_series_rms(V1)
        input_i_rms = calculate_time_series_rms(I1)

        output_active_power, output_reactive_power, output_apparent_power, output_power_factor = calculate_power(xaxis, V4, I4)
        output_power_list.append(output_active_power)

        output_v_rms = calculate_time_series_rms(V4)
        output_i_rms = calculate_time_series_rms(I4)

        efficiency = (output_active_power/input_active_power)*100
        efficiency_list.append(efficiency)


        input_thdv = calculate_thd(input_v_harmonics_amps)
        input_thdi = calculate_thd(input_i_harmonics_amps)
        output_thdv = calculate_thd(output_v_harmonics_amps)
        output_thdi = calculate_thd(output_i_harmonics_amps)

        if input_active_power/input_apparent_power>0.98:
            input_reactive_power = "None (DC)"
            input_apparent_power = "None (DC)"
            input_power_factor = "None (DC)"
            input_thdv = "None (DC)"
            input_thdi = "None (DC)"

        if output_active_power/output_apparent_power>0.98:
            output_reactive_power = "None (DC)"
            output_apparent_power = "None (DC)"
            output_power_factor = "None (DC)"
            output_thdv = "None (DC)"
            output_thdi = "None (DC)"


        df['Test Type'] = pd.Series(test_type)
        df['Power Step (%)'] = pd.Series(power_step[power_step_index])
        df['Input Voltage RMS (V)'] = pd.Series(input_v_rms)
        df['Input Current RMS (A)'] = pd.Series(input_i_rms)
        df['Input Active Power (W)'] = pd.Series(input_active_power)
        df['Input Reactive Power (Var)'] = pd.Series(input_reactive_power)
        df['Input Apparent Power (VA)'] = pd.Series(input_apparent_power)
        df['Input (Total) Power Factor'] = pd.Series(input_power_factor)
        df['Input THDV (%)'] = pd.Series(input_thdv)
        df['Input THDI (%)'] = pd.Series(input_thdi)

        df['Output Voltage RMS (V)'] = pd.Series(output_v_rms)
        df['Output Current RMS (A)'] = pd.Series(output_i_rms)
        df['Output Active Power (W)'] = pd.Series(output_active_power)
        df['Output Reactive Power (Var)'] = pd.Series(output_reactive_power)
        df['Output Apparent Power (VA)'] = pd.Series(output_apparent_power)
        df['Output (Total) Power Factor'] = pd.Series(output_power_factor)
        df['Output THDV (%)'] = pd.Series(output_thdv)
        df['Output THDI (%)'] = pd.Series(output_thdi)
        df['Efficiency (%)'] = pd.Series(efficiency)

        with open(processed_path + "\\Power_data.csv", 'a') as f:
            df.to_csv(f, index=False, header=False)
        power_step_index += 1
    plot_efficiency_curve(path)

def plot_efficiency_curve(path):
    new_path = path + "\\Processed Data\\Figures"
    if not os.path.exists(new_path):
        os.makedirs(new_path)

    df = pd.read_csv(path + "\\Processed Data\Power_data.csv")
    efficiency = df['Efficiency (%)']
    output_power = df['Output Active Power (W)']

    x = list(output_power[:11])
    y = list(efficiency[:11])
    pch = pchip(x, y)
    xx = np.linspace(x[0], x[-1], 500)
    plt.plot(xx, pch(xx), 'g-', label="Increasing Power")
    plt.plot(x, y, 'ko', markersize=4)

    x = list(output_power[11:22])
    y = list(efficiency[11:22])
    pch = pchip(x, y)
    xx = np.linspace(x[0], x[-1], 500)
    plt.plot(xx, pch(xx), 'r-', label="Decreasing Power")
    plt.plot(x, y, 'ko', markersize=4)

    x = list(output_power[22:33])
    y = list(efficiency[22:33])
    pch = pchip(x, y)
    xx = np.linspace(x[0], x[-1], 500)
    plt.plot(xx, pch(xx), 'y-', label="Random Power")
    plt.plot(x, y, 'ko', markersize=4)

    converter_name = path.split("\\")[-1]
    plt.title(converter_name + " - Efficiency Curve")
    plt.xlabel("Output Power (W)")
    plt.ylabel("Efficiency (%)")
    plt.legend()
    plt.grid()
    plt.savefig(path + "\\Processed Data\\Figures\\" + converter_name + " - Efficiency Curve.png")
    plt.show()


def device_metadata(path):
    print "Please fill the information  below regarding the tested converter:\n"
    converter_type = raw_input("Converter Type: AC/DC, DC/DC, DC/AC? ")
    rated_input_voltage = raw_input("Rated Input Voltage (AC or DC)? ")
    rated_output_voltage = raw_input("Rated Output Voltage (AC or DC)? ")
    rated_output_power = raw_input("Rated Output Power (W)? ")
    universal_device_category = raw_input("Universal Device Category? ")

    df = pd.DataFrame(columns=['Converter Type', 'Rated Input Voltage (V)',
                               'Rated Output Voltage (V)', 'Rated Output Power (W)',
                               'Universal Device Category'])

    df['Converter Type'] = pd.Series(converter_type)
    df['Rated Input Voltage (V)'] = pd.Series(rated_input_voltage)
    df['Rated Output Voltage (V)'] = pd.Series(rated_output_voltage)
    df['Rated Output Power (W)'] = pd.Series(rated_output_power)
    df['Universal Device Category'] = pd.Series(universal_device_category)

    path = path + "\\Processed Data"
    if not os.path.exists(path):
        os.makedirs(path)
    df.to_csv(path + "\\Device_metadata.csv", index=False)


def organize_file_list_and_power_steps(path, increasing_power_files_list, decreasing_power_files_list, random_power_files_list):
    incre_pairs = []
    decre_pairs = []
    random_pairs = []

    for file in increasing_power_files_list:
        _, _, _, _, _, _, _, _, I4 = read_csv(path + "\\" + file)
        I4 = np.mean(I4)
        incre_pairs.append((I4,str(file)))
    incre_pairs = sorted(incre_pairs, key=lambda x: x[0])
    crescent_incre_files = list(zip(*incre_pairs)[1])

    for file in decreasing_power_files_list:
        _, _, _, _, _, _, _, _, I4 = read_csv(path + "\\" + file)
        I4 = np.mean(I4)
        decre_pairs.append((I4,str(file)))
    decre_pairs = sorted(decre_pairs, key=lambda x: x[0])
    crescent_decre_files = list(zip(*decre_pairs)[1])

    for file in random_power_files_list:
        _, _, _, _, _, _, _, _, I4 = read_csv(path + "\\" + file)
        I4 = np.mean(I4)
        random_pairs.append((I4,str(file)))
    random_pairs = sorted(random_pairs, key=lambda x: x[0])
    crescent_random_files = list(zip(*random_pairs)[1])

    tests_list = crescent_incre_files + crescent_decre_files + crescent_random_files
    return tests_list

def plot_waveforms(path, tests_list):

    title = path.split("\\")[-1]
    new_path = path + "\\Processed Data\\Figures"
    if not os.path.exists(new_path):
        os.makedirs(new_path)

    power_step = [i * 10 for i in 3 * (range(11))]
    power_step_index = 0
    for file in tests_list:
        xaxis, V1, V2, V3, V4, I1, I2, I3, I4 = read_csv(path + "\\" + file)
        if 'increasing' in file:
            test_type = "Increasing Power"
        elif 'decreasing' in file:
            test_type = "Decreasing Power"
        elif 'random' in file:
            test_type = "Random Power"

        fig, ax = plt.subplots(2, 1)
        font = 10
        t = np.linspace(0, 1, len(xaxis))
        ax[0].set_title(title + "\n" + test_type + " - Power Step " + str(power_step[power_step_index]) + "% - Input Waveforms", fontsize=font)
        ax[0].plot(t, V1)
        ax[0].set_xlim(-0.005, 0.1)
        ax[0].set_ylabel("Voltage Amplitude (V)", fontsize=font)
        ax[0].grid()

        ax[1].plot(t, I1, color="red")
        ax[1].set_xlim(-0.005, 0.1)
        ax[1].set_ylabel("Current Amplitude (A)", fontsize=font)
        ax[1].set_xlabel("Time(s)", fontsize=font)
        ax[1].grid()
        plt.savefig(new_path + "\\" + test_type + " - Power Step " + str(power_step[power_step_index]) + "% - Input Waveforms.png")

        fig, ax = plt.subplots(2, 1)
        ax[0].set_title(title + "\n" + test_type + " - Power Step " + str(power_step[power_step_index]) + "% - Output Waveforms", fontsize=font)
        ax[0].plot(t, V4, label="%.2f V" % np.mean(V4))
        ax[0].set_xlim(-0.005, 0.1)
        ax[0].set_ylim(0, max(V4) + 5)
        ax[0].set_ylabel("Voltage Amplitude (V)", fontsize=font)
        ax[0].legend()
        ax[0].grid()

        ax[1].plot(t, I4, color="red", label="%.2f A" % np.mean(I4))
        ax[1].set_xlim(-0.005, 0.1)
        ax[1].set_ylim(0, max(I4) + 3)
        ax[1].set_ylabel("Current Amplitude (A)", fontsize=font)
        ax[1].set_xlabel("Time (s)", fontsize=font)
        ax[1].grid()
        ax[1].legend()
        plt.savefig(new_path + "\\" + test_type + " - Power Step " + str(power_step[power_step_index]) + "% - Output Waveforms.png")
        plt.close('all')
        power_step_index += 1


def main():
    #PATH = "C:\Users\\arthu\Desktop\Converters Efficiency\Test Data\Tests Uploaded on Google Drive\Converters Efficiency\AC-DC - Fan Converter, 9 VDC - 6.3W"
    root = "C:\Users\\arthu\Desktop\Converters Efficiency\Test Data\Random Power Tests\\"
    os.chdir(root)
    files = [name for name in os.listdir(".") if os.path.isdir(name)]

    files = ['Laptop 2 - Increa, Decrea and Random - With PA and pics']

    for file in files:
        PATH = root + file
        print file

        increasing_power_files_list, decreasing_power_files_list, random_power_files_list = find_csv(PATH)
        tests_list = organize_file_list_and_power_steps(PATH, increasing_power_files_list, decreasing_power_files_list,
                                          random_power_files_list)

        #device_metadata(PATH)
        #write_harmonics_csv(PATH, tests_list)
        write_power_files_csv(PATH, tests_list)
        #plot_harmonics(PATH) #Doesn't need 'tests_lists' because the Harmonic.csv file is already organized in crescent power
        #plot_waveforms(PATH, tests_list)


main()
