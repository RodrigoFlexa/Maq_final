-- Subsistemas de Controle

-- Este arquivo VHDL descreve o comportamento de um sistema de controle para uma máquina de refrigerantes.
-- Ele contém lógica para detecção de moeda, seleção de preços e controle de dispensa de refrigerantes 
-- com base em entradas e botões específicos.

-- Subsistemas de Controle

-- Este arquivo VHDL descreve o comportamento de um sistema de controle para uma máquina de refrigerantes.
-- Ele contém lógica para detecção de moeda, seleção de preços e controle de dispensa de refrigerantes 
-- com base em entradas e botões específicos.

library ieee;
use ieee.std_logic_1164.all;

entity BC is
    port (
        clk : in std_logic;
		  
		  f1 : out std_logic;
		  f2 : out std_logic;
		  
        -- Entradas de Controle
        moeda_Detectada: in std_logic;
        valor_Centavos: in std_logic_vector (7 downto 0);
        preco_Refrigerante_0: in std_logic_vector (7 downto 0);
        preco_Refrigerante_1: in std_logic_vector (7 downto 0);
        
		  botao_1: in std_logic; 
        botao_2: in std_logic;
        reset: in std_logic;
        
        -- Condições de entrada
        comp_maior_entrada : in std_logic;
        comp_menor_entrada : in std_logic;
        comp_igual_entrada	: in std_logic;
        
        -- Saídas de Controle
        refrigerante_Dispensado: out std_logic_vector (1 downto 0);
        -- Sinais de Controle
        valor_Moeda: out std_logic_vector (7 downto 0);
        preco: out std_logic_vector (7 downto 0);
        habilitar_alteracao_reg: out std_logic;
        registro_rst: out std_logic;
        reset_sistema: out std_logic
	
    );
end BC;

architecture rtl of BC is
    type StateType is (waitState, dispenseState);

    signal present_state, next_state: StateType;
    signal f1_int, f2_int: std_logic; -- variáveis intermediárias para f1 e f2

begin
    -- selecione próximo estado
    -- registro de estado

    -- Processo para detectar moeda e acumular seu valor
    detect_coin: process (clk)
    begin    
        -- Verifica se uma moeda foi detectada ou não, se sim, então envia
        -- V para o acumulador, se não, envia 0s
        if moeda_Detectada = '1' then
            valor_Moeda <= valor_Centavos;
        else
            valor_Moeda <= "00000000";
        end if;
    end process detect_coin;

    -- Processo para selecionar o preço com base nos botões pressionados
    escolha_mudanca: process (botao_1, botao_2)
    begin
        if (botao_1 = '1') then
            preco <= preco_Refrigerante_0;
            f1_int <= '1';
        else
            f1_int <= '0';
        end if;

        if (botao_2 = '1') then
            preco <= preco_Refrigerante_1;
            f2_int <= '1';
        else
            f2_int <= '0';
        end if;
    end process escolha_mudanca;

    -- Processo para controlar os estados da máquina de acordo com as entradas e saídas definidas
    state_comb: process (present_state, comp_maior_entrada, comp_igual_entrada, comp_menor_entrada)
    begin
        case present_state is
            when waitState =>
                registro_rst <= '0';
                habilitar_alteracao_reg <= '1';
                refrigerante_Dispensado <= "00";
					
                f1 <= '0';
				
                f2 <= '0';
						  
                if (comp_menor_entrada = '1') then
                    next_state <= waitState;
                else
                    if (comp_maior_entrada = '1') then
                        habilitar_alteracao_reg <= '0';
                    end if;
                    next_state <= dispenseState;
                end if;

            when dispenseState =>
                registro_rst <= '1';
                if (f1_int = '1') then
                    f1 <= '1';
                    refrigerante_Dispensado <= "10";
                else
                    f1 <= '0';
                end if;

                if (f2_int = '1') then
                    f2 <= '1';
                    refrigerante_Dispensado <= "01";
                else
                    f2 <= '0';
                end if;

                habilitar_alteracao_reg <= '1';
                next_state <= waitState;
        end case;

        -- Verificação de reset do sistema
        if (reset = '0') then
            reset_sistema <= '1';
            registro_rst <= '1';
            habilitar_alteracao_reg <= '1';
        end if;
    end process state_comb;

    -- Processo para controlar a transição de estados com base no clock
    estado_com_clock: process (clk)
    begin
        if (rising_edge(clk)) then
            present_state <= next_state;
        end if;
    end process estado_com_clock;
end rtl;
