library verilog;
use verilog.vl_types.all;
entity Maquina_de_refri_vlg_sample_tst is
    port(
        b1              : in     vl_logic;
        b2              : in     vl_logic;
        clk             : in     vl_logic;
        m               : in     vl_logic;
        r1              : in     vl_logic_vector(7 downto 0);
        r2              : in     vl_logic_vector(7 downto 0);
        rst             : in     vl_logic;
        V               : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end Maquina_de_refri_vlg_sample_tst;
