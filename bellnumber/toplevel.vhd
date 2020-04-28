library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity toplevel is
    port (clk, rst, start : in std_logic;
    n : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(7 downto 0));
end toplevel;

architecture rtl of toplevel is
component dp is
     port (clk, rst, wr1, wr2, i_ld, j_ld, sel : in std_logic;
    n : in std_logic_vector(3 downto 0);
    x1, x2 : out std_logic;
    y : out std_logic_vector(7 downto 0));
end component;
component ctrl is
   port(clk,rst, start, x1, x2: in std_logic;
       wr1, wr2, i_ld, j_ld, sel: out std_logic);
end component;
signal wr1, wr2, i_ld, j_ld, sel, x1, x2 : std_logic;
begin
    datapath : dp port map (clk, rst, wr1, wr2, i_ld, j_ld, sel, n, x1, x2, y);
    control : ctrl port map (clk, rst, start, x1, x2, wr1, wr2, i_ld, j_ld, sel);
end rtl;