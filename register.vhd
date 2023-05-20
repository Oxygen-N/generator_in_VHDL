library ieee;
use ieee.std_logic_1164.all;

entity register_24_bit is
    generic( defaulte_value : std_logic := '1' );
	port ( d : in std_logic_vector(0 to 23);
	       q : out std_logic_vector(0 to 23);
	       clk, reset : in std_logic );
end entity register_24_bit;

architecture behavioral of register_24_bit is
begin
	behavior : process (d, clk, reset) is
	begin
		if reset = '1' then
			q(0 to 1) <= '0' & defaulte_value;
			q(2 to 23) <= (others => '0');
		elsif rising_edge(clk) then
			q <= d;
		end if;
	end process behavior;
end architecture behavioral;
