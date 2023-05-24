library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity to_2s_comp is
    port (
        input      : in  signed(23 downto 0);
        output     : out signed(23 downto 0)
    );
end entity;

architecture behavioral of to_2s_comp is
begin
    process (input)
    begin
        if input >= 0 then
            output <= input;
        else
            output <= not input + 1;
        end if;
    end process;
end architecture;
