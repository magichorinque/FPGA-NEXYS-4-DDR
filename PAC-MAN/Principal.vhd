library IEEE;
use IEEE.std_logic_1164.all;

entity Juego_PacMan is
   port(
      RST,pausa,p : in  std_logic;                    -- Reset maestro
      CLK : in  std_logic;  -- Reloj maestro
      up_i, down_i, left_i, rigth_i: in  std_logic;                  
		edisp: out std_logic_vector(7 downto 0);
		disp: out std_logic_vector(6 downto 0); 
		--axysX : in  STD_LOGIC_VECTOR (7 downto 0);
      --ejeY : in  STD_LOGIC_VECTOR (7 downto 0);
      
		--sfsm : out  STD_LOGIC;
      VS  : out std_logic;                    -- Sincronia vertical
      HS,led  : out std_logic;                    -- Sincronia horizontal
      R   : out std_logic_vector(3 downto 0);                    -- Red
      G   : out std_logic_vector(3 downto 0);                    -- Green
      B   : out std_logic_vector(3 downto 0)                     -- Blue
      );
   end Juego_PacMan; 

architecture Prueba of Juego_PacMan is

-- Sincronizador VGA
component Sincronizador_VGA 
   port(
      RST : in  std_logic;                    -- Reset maestro
      CLK : in  std_logic;                    -- Reloj maestro
      VS  : out std_logic;                    -- Sincronia vertical
      HS  : out std_logic;                    -- Sincronia horizontal
      VAD : out std_logic_vector(8 downto 0); -- Direccion vertical
      HAD : out std_logic_vector(9 downto 0); -- Direccion horizontal
      EDS : out std_logic                     -- Habilitacion pixel
      );
   end component;
	
	component Monito is
    Port ( VAD : in  STD_LOGIC_VECTOR(8 downto 0);
           HAD : in  STD_LOGIC_VECTOR(9 downto 0);
			  EDS : in  STD_LOGIC;
			  x,y : in  STD_LOGIC_VECTOR(9 downto 0);
			  R,G,B : out  STD_LOGIC_VECTOR(3 downto 0)
			 );
	end component;
	
	component div3hz is
 port(
      RST : in  std_logic; -- Reset maestro
      CLK : in  std_logic; -- Reloj maestro
      Q   : out std_logic  -- Cero
      );
end component;
	
	component Contador_asc_desc_b is
    Port ( RST : in  std_logic;                    -- Reset maestro
      CLK : in  std_logic;                    -- Reloj maestro
      e,asc,desc : in  std_logic;                    -- Habilitacion de entrada
		Inicio : in std_logic_vector(9 downto 0);
      S : out std_logic_vector(9 downto 0); -- Direccion vertical
      EC  : out std_logic                     -- Fin de cuenta
      );
end component;

component limites is
    Port ( V : in  STD_LOGIC_VECTOR (9 downto 0);
           H : in  STD_LOGIC_VECTOR (9 downto 0);
           actascV : out  STD_LOGIC;
           actdescV : out  STD_LOGIC;
           actascH : out  STD_LOGIC;
           actdescH : out  STD_LOGIC);
end component;

component Monito_abirts_horizontal is
    Port (  VAD : in  STD_LOGIC_VECTOR(8 downto 0);
           HAD : in  STD_LOGIC_VECTOR(9 downto 0);
			  EDS : in  STD_LOGIC;
			  y,x : in  STD_LOGIC_VECTOR(9 downto 0);
			  R,G,B : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end component;

component multiplexor is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC;
           Salida : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Monito_abierta_horizontal_izq is
    Port ( VAD : in  STD_LOGIC_VECTOR(8 downto 0);
           HAD : in  STD_LOGIC_VECTOR(9 downto 0);
			  EDS : in  STD_LOGIC;
			  y,x : in  STD_LOGIC_VECTOR(9 downto 0);
			  R,G,B : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end component;

component Multiplexor_caritas is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B,C : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           sel1,sel2 : in  STD_LOGIC);
end component;

component Voca_abierta_down is
    Port ( VAD : in  STD_LOGIC_VECTOR(8 downto 0);
           HAD : in  STD_LOGIC_VECTOR(9 downto 0);
			  EDS : in  STD_LOGIC;
			  y,x : in  STD_LOGIC_VECTOR(9 downto 0);
			  R,G,B : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end component;

component Voca_abierta_up is
    Port ( VAD : in  STD_LOGIC_VECTOR(8 downto 0);
           HAD : in  STD_LOGIC_VECTOR(9 downto 0);
			  EDS : in  STD_LOGIC;
			  y,x : in  STD_LOGIC_VECTOR(9 downto 0);
			  R,G,B : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component Escenario is
    Port (  VAD : in  STD_LOGIC_VECTOR(8 downto 0);
           HAD : in  STD_LOGIC_VECTOR(9 downto 0);
			  EDS : in  STD_LOGIC;
			  R,G,B : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end component;

component bola_grande is
    Port (  VAD : in  STD_LOGIC_VECTOR(8 downto 0);
           HAD : in  STD_LOGIC_VECTOR(9 downto 0);
			  EDS,E : in  STD_LOGIC;
			  y,x : in  STD_LOGIC_VECTOR(9 downto 0);
			  R,G,B : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end component;

component  FFD_1b is
    Port ( A : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
			  e : in  STD_LOGIC;
           SA : out  STD_LOGIC);
end component;

component bola_pequena is
    Port ( VAD : in  STD_LOGIC_VECTOR(8 downto 0);
           HAD : in  STD_LOGIC_VECTOR(9 downto 0);
			  EDS,E : in  STD_LOGIC;
			  y,x : in  STD_LOGIC_VECTOR(9 downto 0);
			  R,G,B : out  STD_LOGIC_VECTOR(3 downto 0)
			  );
end component;

COMPONENT Bolas_grandes is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0);
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Bolas_pequeas is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
	 );
end component;

component Bolas_pequeas_96 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

component Bola_pequea_304 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

component Bola_pequea_448 is
    Port (SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

component bola_pequea_144 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

component bola_pequea_400 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

component Bola_pequea_352 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

component bola_pequea_120 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

component bolas_pequeas_200 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

component bola_pequea_248 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

component bola_pequea_298 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

component bola_pequea_152 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

component bola_pequea_344 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

COMPONENT bola_pequea_392 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

component bola_pequea_440 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

component bola_pequea_488 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end  component;

component  bola_pequea_504 is
    Port ( SCH : in  STD_LOGIC_VECTOR (9 downto 0);
           SCV : in  STD_LOGIC_VECTOR (9 downto 0); 
			  VAD : in  STD_LOGIC_VECTOR (8 downto 0);
           HAD : in  STD_LOGIC_VECTOR (9 downto 0);
			  EDS : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0);
           G : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
			  
end component;

component joystick_1 is
    Port ( axysX : in  STD_LOGIC_VECTOR (7 downto 0);
           ejeY : in  STD_LOGIC_VECTOR (7 downto 0);
           upX : out  STD_LOGIC;
           downX : out  STD_LOGIC;
           rightY : out  STD_LOGIC;
           leftY : out  STD_LOGIC;
           sfsm : out  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC);
end component;

component  modulo_1hz is
    Port ( RST : in  std_logic; -- Reset maestro
			CLK : in  std_logic; -- Reloj maestro
			Q   : out std_logic  -- Cero
	 );
end component;

component contador_60hz is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           e : in  STD_LOGIC;
           tc : out  STD_LOGIC;
           u : out  STD_LOGIC_VECTOR (3 downto 0);
           d : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component verificar_60 is
    Port ( clk,rst : in  STD_LOGIC;
			  u : in  STD_LOGIC_VECTOR (3 downto 0);
           d : in  STD_LOGIC_VECTOR (3 downto 0);
           s1 : out  STD_LOGIC;
           s2 : out  STD_LOGIC);
end component;

component Displays is
    Port ( C1 : in  STD_LOGIC_VECTOR (4 downto 0);
           C2 : in  STD_LOGIC_VECTOR (4 downto 0);
           C3 : in  STD_LOGIC_VECTOR (4 downto 0);
           C4 : in  STD_LOGIC_VECTOR (4 downto 0);
           C5 : in  STD_LOGIC_VECTOR (4 downto 0);
           C6 : in  STD_LOGIC_VECTOR (4 downto 0);
           C7 : in  STD_LOGIC_VECTOR (4 downto 0);
           C8 : in  STD_LOGIC_VECTOR (4 downto 0);
           rst  : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           disp : out  STD_LOGIC_VECTOR (6 downto 0);
           edisp : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component FSM_1pulso is
    Port ( actv : in  STD_LOGIC;
				clk,rst : in  STD_LOGIC;
           s : out  STD_LOGIC);
end component;
	
signal auxu,auxu1,auxd,auxd1 :std_logic_vector(4 downto 0);
signal EDS,sdiv1,sdiv2,tcv,tch,tc1,tc2,rstcont,econt,sactascV,sactdescV,sactascH,sactdescH,aux1,aux2,aux3,aux4,aux5,aux6,aux7,aux8, aux9: std_logic;
signal VAD: std_logic_vector(8 downto 0);
signal ascv,descv,asch,desch,auxdiv2,activacion :   std_logic;
signal HAD,scv,sch: std_logic_vector(9 downto 0);
signal R1,g1,b1,r2,g2,b2,R3,G3,B3,R4,G4,B4,R5,G5,B5,R6,G6,B6,R7,G7,B7,R8,G8,B8,R9,G9,B9,R10,G10,B10,u,d,u1,d1: std_logic_vector(3 downto 0);
signal BGR,BGG,BGB,BPR,BPG,BPB,BPR96,BPG96,BPB96,BPR304,BPG304,BPB304,BPR448,BPG448,BPB448,BPR144,BPG144,BPB144,BPR400,BPG400,BPB400,BPR352,BPG352,BPB352: std_logic_vector(3 downto 0);
signal BPR120,BPG120,BPB120,BPR200,BPG200,BPB200,BPR248,BPG248,BPB248,BPR298,BPG298,BPB298,BPR152,BPG152,BPB152,BPR344,BPG344,BPB344,BPR392,BPG392,BPB392,BPR440,BPG440,BPB440,BPR488,BPG488,BPB488,BPR504,BPG504,BPB504: std_logic_vector(3 downto 0);

begin
	led <= p and '1';
	fsm: FSM_1pulso port map (pausa,clk,rst,activacion);

	div1hz: modulo_1hz port map (rst,clk,sdiv2);

	auxdiv2 <= sdiv2 and activacion;
	
	conta: contador_60hz port map (clk,rstcont,auxdiv2,tc1,u,d);
	
	verificar60pul: verificar_60 port map (clk,rst,u,d,rstcont,econt);
	
	conta2: contador_60hz port map (clk,rst,econt,tc2,u1,d1);
	
	auxu <= '0' & u;
	auxu1 <= '0' & u1;
	auxd <= '0' & d;
	auxd1 <= '0' & d1;
	
	display: Displays port map (auxu,auxd,auxu1,auxd1,"00000","00000","00000","00000",rst,clk,disp,edisp);
	
--	joystick: joystick_1 port map (axysX,ejeY,descv,ascv,asch,desch,sfsm,rst,clk);
asch <= rigth_i;
desch <= left_i;
descv <= up_i;
ascv <= down_i;

   DUT_01: Sincronizador_VGA port map(RST,CLK,VS,HS,VAD,HAD,EDS);
	
	div1: div3hz port map (rst,clk,sdiv1);
	
	contV:Contador_asc_desc_b port map (rst,clk,sdiv1,aux1,aux2,"0100000000",scv,tcv);
	contH:Contador_asc_desc_b port map (rst,clk,sdiv1,aux3,aux4,"0101000000",sch,tch);
	
	Verificar: limites port map (scv,sch,sactascV,sactdescV,sactascH,sactdescH);
	
	aux1<=ascV and sactascV and activacion and ( (not ascH) and (not descH));
	aux2<=descV and sactdescV and activacion and ( (not ascH) and (not descH));
	aux3<=ascH and sactascH and activacion and ( (not ascV) and (not descV));
	aux4<=descH and sactdescH and activacion and ( (not ascV) and (not descV));
	
	comp: Monito port map(VAD,HAD,EDS,sch,scv,R1,G1,B1);
	
	abiertoDer: Monito_abirts_horizontal port map (VAD,HAD,EDS,scv,sch,R2,G2,B2);
	abiertoIzq: Monito_abierta_horizontal_izq port map (VAD,HAD,EDS,scv,sch,R3,G3,B3);
	abiertoUp: Voca_abierta_down port map (VAD,HAD,EDS,scv,sch,R5,G5,B5);
	abiertoDown: Voca_abierta_up port map (VAD,HAD,EDS,scv,sch,R6,G6,B6);
	
	multiHR: Multiplexor_caritas port map (R2,R3,R1,R4,ascH,descH);
	multiHG: Multiplexor_caritas port map (G2,G3,G1,G4,ascH,descH);
	multiHB: Multiplexor_caritas port map (B2,B3,B1,B4,ascH,descH);
	
	multiVR: Multiplexor_caritas port map (R5,R6,R1,R7,ascV,descV);
	multiVG: Multiplexor_caritas port map (G5,G6,G1,G7,ascV,descV);
	multiVB: Multiplexor_caritas port map (B5,B6,B1,B7,ascV,descV);
	
	aux5 <= ascH or descH;
	aux6 <= ascV or descV;
	
	multiCarR: Multiplexor_caritas port map (R4,R7,R1,R8,aux5,aux6);
	multiCarG: Multiplexor_caritas port map (G4,G7,G1,G8,aux5,aux6);
	multiCarB: Multiplexor_caritas port map (B4,B7,B1,B8,aux5,aux6);
	
	aux7 <= sch(3) and (aux3 or aux4);
	aux8 <= scv(3) and (aux1 or aux2);
	aux9 <= aux7 or aux8;
		
	multiR: multiplexor port map (R1,R8,aux9,R9);
	multiG: multiplexor port map (G1,G8,aux9,G9);
	multiB: multiplexor port map (B1,B8,aux9,B9);
	
	Esce: Escenario port map (VAD,HAD,EDS,R10,G10,B10);
	
	BolasG: Bolas_grandes port map ( sch,scv,VAD,HAD,EDS,clk,rst,BGR,BGG,BGB);
	
	BolasP: Bolas_pequeas port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR,BPG,BPB);
	
	BolasP96: Bolas_pequeas_96 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR96,BPG96,BPB96);
	
	BolasP304: Bola_pequea_304 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR304,BPG304,BPB304);
	
	BolasP448: Bola_pequea_448 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR448,BPG448,BPB448);
	
	BolasP144: Bola_pequea_144 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR144,BPG144,BPB144);
	
	BolasP400: Bola_pequea_400 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR400,BPG400,BPB400);
	
	BolasP352: Bola_pequea_352 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR352,BPG352,BPB352);
	
	BolasP120: Bola_pequea_120 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR120,BPG120,BPB120);
	
	BolasP200: bolas_pequeas_200 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR200,BPG200,BPB200);
	
	BolasP248: Bola_pequea_248 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR248,BPG248,BPB248);
	
	BolasP298: bola_pequea_298 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR298,BPG298,BPB298);
	
	BolasP152: bola_pequea_152 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR152,BPG152,BPB152);
	
	BolasP344: bola_pequea_344 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR344,BPG344,BPB344);
	
	BolasP392: bola_pequea_392 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR392,BPG392,BPB392);
	
	BolasP440: bola_pequea_440 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR440,BPG440,BPB440);
	
	BolasP488: bola_pequea_488 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR488,BPG488,BPB488);
	
	BolasP504: bola_pequea_504 port map ( sch,scv,VAD,HAD,EDS,clk,rst,BPR504,BPG504,BPB504);
	
	R <= R9 or R10 or BGR or BPR or BPR96 or BPR304 or BPR448 or BPR144 or BPR400 or BPR352 or BPR120 or BPR200 or BPR248 or BPR298 or BPR152 or BPR344 or BPR392 or BPR440 or BPR488 or BPR504;
	G <= G9 or G10 or BGG or BPG or BPG96 or BPG304 or BPG448 or BPG144 or BPG400 or BPG352 or BPG120 or BPG200 or BPG248 or BPG298 or BPG152 or BPG344 or BPG392 or BPG440 or BPG488 or BPG504;
	B <= B9 or B10 or BGB or BPB or BPB96 or BPB304 or BPB448 or BPB144 or BPB400 or BPB352 or BPB120 or BPB200 or BPB248 or BPB298 or BPB152 or BPB344 or BPB392 or BPB440 or BPB488 or BPB504;
	
end Prueba;

