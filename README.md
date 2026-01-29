# UART_Transmitter
A synthesizable FSM-based UART TX/RX implemented in Verilog and verified using a self-checking testbench and GTKWave.
This project implements a UART (Universal Asynchronous Receiver Transmitter) using Verilog RTL. Both the transmitter and receiver are designed using finite state machines (FSMs) and verified through a self-checking testbench with waveform analysis using GTKWave.
## What is UART?
UART is an asynchronous serial communication protocol that transmits data one bit at a time without a shared clock between the transmitter and receiver. Communication is synchronized using a predefined baud rate and framing structure consisting of:
1. Start bit (logic 0)
2. Data bits (LSB first)
3. Stop bit (logic 1)
# Design Description
### UART Transmitter
The transmitter converts 8-bit parallel data into a serial stream using an FSM.
**Key Signals:**
- `i_DV` – Data valid input to start transmission
- `i_Byte` – 8-bit parallel input data
- `o_Serial_Data` – Serialized UART output
- `o_Sig_Active` – Indicates transmitter is busy
- `o_Sig_Done` – Indicates transmission completion
### UART Receiver
The receiver reconstructs serial data back into parallel form.
**Key Signals:**
- `i_Serial_Data` - UART serial input
- `o_Byte` - Received 8-bit parallel data
- `o_DV` - Data valid output pulse
### FSM (Finite State Machine)
**Transmitter and Receiver FSM States**
- IDLE
- START
- DATA
- STOP
- REFRESH

FSM-based control ensures deterministic timing and protocol correctness.
### Timing Parameter 
The parameter `FREQUENCY` defines the number of clock cycles per UART bit.
By modifying this parameter, the design can be adapted to different baud rates without changing the core logic.
### Verification Strategy
- A self-checking Verilog testbench was used.
- Known data is transmitted through the UART transmitter
- Serialized output is looped back into the receiver
- GTKWave is used to inspect: FSM transitions, Bit timing, Serial data framing, Correct byte reconstruction
## How to Run the Simulation
Follow the steps below to compile and simulate the UART transmitter and receiver.

```bash

iverilog transmitter.v receiver.v testbench.v
vvp a.out
gtkwave testbench.vcd

```
## Waveform Verification (GTKWave)
### Transmitter operation 
![UART Transmitter Waveform](waveform/Tx_operation.png)
### Receiver operation
![UART Receiver Waveform](waveform/Rx_operation.png)
### End-to-End UART Communication
![UART End-to-End Waveform](waveform/End_to_End_communication.png)
## Result 
- Correct UART framing observed in waveforms
- Proper FSM transitions in both transmitter and receiver
- Received byte matches transmitted byte
- Data valid signal asserted after successful reception
## Future Improvements
- Configurable data width
- Parity bit support
- Framing error detection
- Support for additional serial protocols (e.g., SPI)




