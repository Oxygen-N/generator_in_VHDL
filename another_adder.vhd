-- an attempt to make a working adder. connected to nothing

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

use std.textio.all;

entity adder_24bit is
  port (
    A : in std_logic_vector(1 downto -22);
    B : in std_logic_vector(1 downto -22);
    Sum : out std_logic_vector(1 downto -22)
  );
end entity adder_24bit;

architecture behavioral of adder_24bit is
begin
  process(A, B)
    variable tempsum : integer;
  begin
    tempsum := to_integer(signed(A)) + to_integer(signed(B));
    report "A:" & integer'image(to_integer(unsigned(A)));
    report "B:" & integer'image(to_integer(unsigned(B)));
--    if tempsum < 0 then
--      Sum <= not std_logic_vector(unsigned(abs(tempsum)) + 1);
--    else
--      Sum <= std_logic_vector(to_unsigned(tempsum, 24));
--    end if;

  end process;
end architecture behavioral;