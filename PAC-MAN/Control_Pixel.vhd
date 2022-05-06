library IEEE;
use IEEE.std_logic_1164.all;

entity Control_Pixel is
   port(
      EDS : in  std_logic;                    -- Habilitacion
      PIX : in  std_logic_vector(2 downto 0); -- Color
      R   : out   std_logic_vector(2 downto 0);                     -- Red
      G   : out   std_logic_vector(2 downto 0);                     -- Green
      B   : out   std_logic_vector(1 downto 0)                     -- Blue
      );
   end Control_Pixel;

architecture Simple of Control_Pixel is

begin

   R(2) <= EDS AND PIX(2);
	R(1) <= EDS AND PIX(2);
	R(0) <= EDS AND PIX(2);
   G(2) <= EDS AND PIX(1);
	G(1) <= EDS AND PIX(1);
	G(0) <= EDS AND PIX(1);
   B(1) <= EDS AND PIX(0);
	B(0) <= EDS AND PIX(0);

end Simple;