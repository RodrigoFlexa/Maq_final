library IEEE;
use IEEE.std_logic_1164.all;

entity acumulador_8_bits is
    port (
        dados_entrada: in std_logic_vector (7 downto 0);
        clk, rst: in std_logic;
        dados_saida: out std_logic_vector (7 downto 0)
    );
end acumulador_8_bits;

architecture implementacao_acumulador_8_bits of acumulador_8_bits is
    component implementacao_somador_8_bits 
        port (
            A, B: in std_logic_vector (7 downto 0);
            Soma: out std_logic_vector (7 downto 0);
            Vai_um: out std_logic
        );
    end component;

    component registrador_8_bits 
        port (
            dados: in std_logic_vector (7 downto 0);
            clk, reset_sincrono: in std_logic;
            saida: out std_logic_vector (7 downto 0)
        );
    end component;

	signal  bit_adder_C_out: std_logic;	
	signal adder_sum, regOut: std_logic_vector(7 downto 0) ;

begin
	adder_output: implementacao_somador_8_bits port map (dados_entrada,regOut, adder_sum, bit_adder_C_out);
	reg_output : registrador_8_bits port map (adder_sum, clk, rst,regOut);
	dados_saida <= regOut;

end implementacao_acumulador_8_bits;
