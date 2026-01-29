# UART_Transmitter
A synthesizable FSM-based UART TX/RX implemented in Verilog and verified using a self-checking testbench and GTKWave.
This project implements a UART (Universal Asynchronous Receiver Transmitter) using Verilog RTL. Both the transmitter and receiver are designed using finite state machines (FSMs) and verified through a self-checking testbench with waveform analysis using GTKWave.
# What is UART?
UART is an asynchronous serial communication protocol that transmits data one bit at a time without a shared clock between the transmitter and receiver. Communication is synchronized using a predefined baud rate and framing structure consisting of:
1. Start bit (logic 0)
2. Data bits (LSB first)
3. Stop bit (logic 1)
# Description
## 1) UART Transmitter
The transmitter converts 8-bit parallel data into a serial stream using an FSM.
i. "i_DV" – Data valid input to start transmission
ii. "i_Byte" – 8-bit parallel input data
iii. "o_Serial_Data" – Serialized UART output
iv. "o_Sig_Active" – Indicates transmitter is busy
v. "o_Sig_Done" – Indicates transmission completion
