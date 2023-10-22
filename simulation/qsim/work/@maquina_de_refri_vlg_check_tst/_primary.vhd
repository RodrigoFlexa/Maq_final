library verilog;
use verilog.vl_types.all;
entity Maquina_de_refri_vlg_check_tst is
    port(
        f1              : in     vl_logic;
        f2              : in     vl_logic;
        K               : in     vl_logic_vector(1 downto 0);
        tot             : in     vl_logic_vector(7 downto 0);
        vt              : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end Maquina_de_refri_vlg_check_tst;
