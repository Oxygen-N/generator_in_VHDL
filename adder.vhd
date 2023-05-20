library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum is
  port (
    a, b : in std_logic_vector(23 downto 0);
    c   : out std_logic_vector(23 downto 0)
  );
end sum;

architecture behavioral of sum is
begin
  c <= std_logic_vector(signed(a) + signed(b));
end behavioral;
