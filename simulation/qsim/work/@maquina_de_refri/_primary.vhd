library verilog;
use verilog.vl_types.all;
entity Maquina_de_refri is
    port(
        m               : in     vl_logic;
        b1              : in     vl_logic;
        b2              : in     vl_logic;
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        V               : in     vl_logic_vector(7 downto 0);
        r1              : in     vl_logic_vector(7 downto 0);
        r2              : in     vl_logic_vector(7 downto 0);
        tot             : out    vl_logic_vector(7 downto 0);
        vt              : out    vl_logic_vector(7 downto 0);
        K               : out    vl_logic_vector(1 downto 0);
        f1              : out    vl_logic;
        f2              : out    vl_logic
    );
end Maquina_de_refri;
