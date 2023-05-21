library ieee;
use ieee.std_logic_1164.all;

entity sin_generator_1209 is
    port (clk, reset: in std_logic;
          Y: out std_logic_vector(1 to 24));
end sin_generator_1209;

architecture behavioral of sin_generator_1209 is 
    signal Z_0, Z_1: std_logic_vector(1 to 24);
    signal S_0, S_1: std_logic_vector(1 to 24);
    signal C_0, C_1: std_logic_vector(1 to 24);
    signal Sin_1209, Cos_1209: std_logic_vector(1 to 24);

begin
    gate1: entity work.register_24_bit(behavioral)
    port map(d => Sin_1209, q => Z_0, clk => clk, reset => reset);

    gate2: entity work.register_24_bit(behavioral)
    port map(d => Cos_1209, q => Z_1, clk => clk, reset => reset);

    gate3: entity work.multiplier(dataflow)
    generic map(N => open, C => 0.68865848)
    port map(A => Z_0, Y => S_0);

    gate4: entity work.multiplier(dataflow)
    generic map(N => open, C => 0.68865848)
    port map(A => Z_1, Y => S_1);

    gate5: entity work.multiplier(dataflow)
    generic map(N => open, C => 0.72508597)
    port map(A => Z_0, Y => C_0);

    gate6: entity work.multiplier(dataflow)
    generic map(N => open, C => 0.72508597)
    port map(A => Z_1, Y => C_1);

    gate7: entity work.sum(behavioral)
    port map(a => C_0, b => S_1, c => Sin_1209);

    gate8: entity work.sum(behavioral)
    port map(a => C_1, b => S_0, c => Cos_1209);

    Y <= Sin_1209;

end behavioral;