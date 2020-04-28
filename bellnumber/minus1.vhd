library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity minus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end minus1;

architecture rtl of minus1 is
signal y_uns : unsigned(3 downto 0);
begin
y_uns <= unsigned(a) - 1;
y <= std_logic_vector(y_uns);
end rtl;
