library ieee;
use ieee.std_logic_1164.all;

entity reg is
  port ( d : in std_logic_vector(0 to 23);
         q : out std_logic_vector(0 to 23);
         clk, reset : in std_logic );
end entity reg;

architecture behavioral of reg is
begin
  behavior : process (clk, reset) is
    variable zero : std_logic_vector(0 to 23);
  begin
    if reset = '1' then
      q <= zero;
    elsif rising_edge(clk) then
      q <= d;
    end if;
  end process behavior;
end architecture behavioral;
