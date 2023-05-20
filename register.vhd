library ieee;
use ieee.std_logic_1164.all;

entity register_24_bit is
    generic( defaulte_value : std_logic );
	port ( d : in std_logic_vector(0 to 23);
	       q : out std_logic_vector(0 to 23);
	       clk, reset : in std_logic );
end entity register_24_bit;

architecture behavioral of register_24_bit is
begin
	behavior : process (d, clk, reset) is
		constant def_value : std_logic_vector(0 to 23) := (others => defaulte_value);
	begin
		if reset = '1' then
			q <= def_value;
		elsif rising_edge(clk) then
			q <= d;
		end if;
	end process behavior;
end architecture behavioral;
