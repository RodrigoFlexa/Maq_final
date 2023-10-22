-- Implementa a lógica de um somador de um bit, com entradas A, B e C, e as saídas Soma e Vai-um (Carry).

library IEEE;
use IEEE.std_logic_1164.all;

entity somador_um_bit is
    port (
        A, B, C: in std_logic; -- Entradas do somador
        Soma, Vai_um: out std_logic -- Saídas do somador
    );
end somador_um_bit;

-- Visão da estrutura do Half Adder
architecture comportamento of somador_um_bit is

-- Componentes internos utilizados para a lógica do somador
component not_gate
    port (
        I: in std_logic;
        O: out std_logic
    );
end component;

component and_gate_3_input
    port (
        I1, I2, I3: in std_logic;
        O: out std_logic
    );
end component;

component and_gate
    port (
        I1, I2: in std_logic;
        O: out std_logic
    );
end component;

component or_gate
    port (
        I1, I2: in std_logic;
        O: out std_logic
    );
end component;

component or_gate_3_inputs
    port (
        I1, I2, I3: in std_logic;
        O: out std_logic
    );
end component;

component or_gate_4_inputs
    port (
        I1, I2, I3, I4: in std_logic;
        O: out std_logic
    );
end component;

-- Sinais intermediários utilizados para a lógica do somador
signal A_not, B_not, C_not, op1, op2, op3, op4, op5, op6, op7: std_logic;

begin
    -- Mapeia as portas de entrada através de portas lógicas e atribui os resultados às portas de saída
    -- Mapeia as portas de entrada através de portas lógicas e atribui os resultados às portas de saída
    G1: not_gate port map (A, A_not);
    G2: not_gate port map (B, B_not);
    G3: not_gate port map (C, C_not);
    
    G4: and_gate_3_input port map (A_not, B_not, C, op1);
    G5: and_gate_3_input port map (A_not, B, C_not, op2);
    G6: and_gate_3_input port map (A, B_not, C_not, op3);
    G7: and_gate_3_input port map (A, B, C, op4);
    G8: or_gate_4_inputs port map (op1, op2, op3, op4, Soma);
    
    G9:  and_gate port map (B, C, op5);
    G10: and_gate port map (A, C, op6);
    G11: and_gate port map (A, B, op7);
    G12: or_gate_3_inputs port map (op5, op6, op7, Vai_um);
end comportamento;
