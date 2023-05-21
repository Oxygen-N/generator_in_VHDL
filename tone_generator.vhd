library ieee;
use ieee.std_logic_1164.all;

entity tone_generator is
    port(clk, reset: in std_logic;
	 tone: out std_logic_vector(1 to 24));
end tone_generator; 

architecture behavioral of tone_generator is
    signal Sin_697, Sin_1209: std_logic_vector(1 to 24);

begin
    gate1: entity work.sin_generator_697(behavioral)
    port map(clk => clk, reset => reset, Y => Sin_697);

    gate2: entity work.sin_generator_1209(behavioral)
    port map(clk => clk, reset => reset, Y => Sin_1209);

    gate3: entity work.sum(behavioral)
    port map(a => Sin_697, b => Sin_1209, c => tone);

end behavioral;