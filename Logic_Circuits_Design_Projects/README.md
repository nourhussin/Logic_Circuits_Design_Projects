# Logic Circuits Design Projects Repository

This repository contains several Verilog projects for digital circuit design. Each project is implemented in Verilog and is intended to be used with FPGA development boards or Verilog simulation tools. Below is a brief overview of each project:

## Project 1: Three-Function Barrel Shifter

A barrel shifter is a versatile circuit capable of shifting input data in various ways, including rotation, logical shifts, and arithmetic shifts. This project implements an 8-bit barrel shifter that can perform both left and right shifts with different modes.

## Project 2: Serial Data Transmitter

The serial data transmitter project focuses on taking parallel data and transmitting it serially with specific constraints, including start and stop bits, and parity checking. It's designed to work with clock signals and control signals to transmit data serially.

## Project 3: Serial Data Receiver

This project complements the Serial Data Transmitter by receiving and processing serial data. It checks for errors such as parity and stop bit violations and outputs valid data when reception is complete.

## Project 4: Pulse Width Modulation Circuit

A Pulse Width Modulation (PWM) circuit generates a square wave with an adjustable duty cycle. This project allows you to control the duty cycle using a 4-bit control signal, providing a range of duty cycle settings.

## Project 5: 8-bit Super Register (Universal Register/Counter)

The 8-bit Super Register serves as both a universal shift register and a counter. It can perform various operations, including loading data, shifting, rotating, storing data, and counting up or down.

## Project 6: Digital Square VCO (Voltage-Controlled Oscillator)

This project implements a digital Voltage-Controlled Oscillator (VCO) that generates square wave outputs. The frequency of the square wave can be controlled using input control bits, providing flexibility in generating different frequencies.

## Project 7: Digital Stopwatch

The Digital Stopwatch counts down from user-defined minutes and seconds. It can be started and stopped using a control signal and signals the end of counting.

## Project 8: Digital Clock

The Digital Clock module simulates a clock display, indicating hours, minutes, and seconds. It runs with a 1 Hz clock input and allows setting the initial time.

For detailed information and usage instructions for each project, please refer to their respective directories.
