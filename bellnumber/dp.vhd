library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, wr1, wr2, i_ld, j_ld, sel : in std_logic;
    n : in std_logic_vector(3 downto 0);
    x1, x2 : out std_logic;
    y : out std_logic_vector(7 downto 0));
end dp;

architecture rtl of dp is
component reg is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(3 downto 0);
reg_out: out std_logic_vector(3 downto 0));
end component;
component mux is
    port (s : in std_logic;
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component plus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component ram is
port(clk, wr1, wr2 : in std_logic;
i,j, n : in std_logic_vector(3 downto 0);
y : out std_logic_vector(7 downto 0));
end component;
component compgr is
    port (
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end component;
signal i, j, i_in, j_in, iplus1, jplus1 : std_logic_vector(3 downto 0);
begin
    i_reg : reg port map (clk, rst, i_ld, i_in, i);
    i_mux : mux port map (sel, "0001", iplus1, i_in);
    i_plus : plus1 port map (i, iplus1);
    j_reg : reg port map (clk, rst, j_ld, j_in, j);
    j_mux : mux port map (sel, "0001", jplus1, j_in);
    j_plus : plus1 port map (j, jplus1);
    i_comp : compgr port map (i, n, x1);
    j_comp : compgr port map (j, i, x2);
    bell_ram : ram port map (clk, wr1, wr2, i, j, n, y);
end rtl;