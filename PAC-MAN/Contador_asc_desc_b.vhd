library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Contador_asc_desc_b is
    Port ( RST : in  std_logic;                    -- Reset maestro
      CLK : in  std_logic;                    -- Reloj maestro
      e,asc,desc : in  std_logic;                    -- Habilitacion de entrada
		Inicio : in std_logic_vector(9 downto 0);
      S : out std_logic_vector(9 downto 0); -- Direccion vertical
      EC  : out std_logic                     -- Fin de cuenta
      );
end Contador_asc_desc_b;

architecture Behavioral of Contador_asc_desc_b is
-- Estados internos
signal Qp, Qn : std_logic_vector(9 downto 0);

-- Detector de 479
signal Z      : std_logic;

-- Incrementador
signal I      : std_logic_vector(9 downto 0);

-- Anulador
signal A      : std_logic_vector(9 downto 0);

begin

   Detector: process(Qp)
   begin
      if (Qp="1111111111") then
         Z <= '0';
      else
         Z <= '1';
      end if;
   end process Detector;

   Incrementador: process(Qp,asc,desc,e)
   begin
	if(asc = '1' and e = '1') then
      I   <= Qp + 1;
	elsif(desc= '1' and e = '1') then
		I   <= Qp - 1;
	else 
		I <= Qp;
	end if;
      S <= Qp;
   end process Incrementador;

   Anulador: process(Z,I,e)
   begin
      for j in 0 to 9 loop
         A(j) <= Z AND I(j);
      end loop;
      EC <= NOT(Z) AND E;
   end process Anulador;

   Habilitacion: process(Qp,e,A,asc,desc)
   begin
	  if (e='1') then
	     Qn <= A;
	  else
	     Qn <= Qp;
	  end if;
   end process Habilitacion;
   
   Secuencial: process(RST,CLK,inicio)
   begin
      if (RST='0') then
         Qp <= Inicio;
      elsif (CLK'event and CLK='1') then 
         Qp <= Qn;
      end if;
   end process Secuencial;

end Behavioral;

