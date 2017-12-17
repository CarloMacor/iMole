//
//  iMoleFreeViewController.m
//  iMoleFree
//
//  Created by Carlo Macor on 02/02/10.
//  Copyright Carlo Macor 2010. All rights reserved.
//

#import "iMoleFreeViewController.h"

typedef enum {
	kstate_StartGame,
	kstate_MenuOpen,     kstate_MenuRun,	    kstate_MenuClose,
	
	kstate_newGameMenuOpen, kstate_NewGameMenuRun,
	
	kstate_ContinueOpen,
	
	kstate_inGame,
	
	
	kstate_inInfoOpen,	    kstate_inInfo,          kstate_inInfoClose,
	kstate_inSetUpOpen,	    kstate_inSetUp,         kstate_inSetUpClose,
	kstate_inRecordsOpen,	kstate_inRecords,       kstate_inRecordsClose,
	kstate_inTutorialOpen,  kstate_inTutorial,      kstate_inTutorialClose,
	
    kstate_BackMenu,
	kstate_inErase,
	
	kstate_InitQuadroOpen
}  gameStates;



@interface iMoleFreeViewController (private)

- (void) fissavariabili;

- (void) setupvariabili;
- (void) loadMenu;
- (void) loadDigits;

- (void) AttesaIniziale;

- (void) scrivinumerotalpe;
- (void) scrivitime ;
- (int)  casuale                    : (int) max ;

- (void) p_StartMenuOpen;
- (void) p_MenuOpen;
- (void) p_MenuRun;
- (void) p_MenuClose;
- (void) p_EndMenuClose;

- (void) p_StartNewGameOpen;
- (void) p_StartContinueOpen;
- (void) p_ContinueOpen;

- (void) p_StartRecordsOpen;
- (void) p_StartSetUpOpen;
- (void) p_StartInfoOpen;

- (void) p_StarttutorialOpen;

- (BOOL) TestInsidepausegame ;

- (void) NewGameSetUp;
- (void) aggiornatempo;
- (void) fissavariabiliData ;
- (void) Inverti_fissavariabiliData;

- (void) p_EraseOpen;
- (void) p_EraseClose;
- (int)  dammifotogrammasequenza : (int) indbuca;
- (void) Suona                      : (int) ind;

- (void) caricabrowser ;

int    i_dimx2opzmenu;
int    i_dimy2opzmenu;


@end




@implementation iMoleFreeViewController


@synthesize  gameState ;
@synthesize  sceltamenu ;

- (void) setupnomikey                                {
	Key_nomeplayer[0] =@"x1";
	Key_nomeplayer[1] =@"x2";
	Key_nomeplayer[2] =@"x3";
	
	Key_nomerecords[0]  =@"A00";
	Key_nomerecords[1]  =@"A01";
	Key_nomerecords[2]  =@"A02";
	Key_nomerecords[3]  =@"A03";
	Key_nomerecords[4]  =@"A04";
	Key_nomerecords[5]  =@"A05";
	Key_nomerecords[6]  =@"A06";
	Key_nomerecords[7]  =@"A07";
	Key_nomerecords[8]  =@"A08";
	Key_nomerecords[9]  =@"A09";
	Key_nomerecords[10] =@"A10";
	Key_nomerecords[11] =@"A11";
	Key_nomerecords[12] =@"A12";
	Key_nomerecords[13] =@"A13";
	Key_nomerecords[14] =@"A14";
	Key_nomerecords[15] =@"A15";
	
	Key_intrecords [ 0] =@"B00";
	Key_intrecords [ 1] =@"B01";
	Key_intrecords [ 2] =@"B02";
	Key_intrecords [ 3] =@"B03";
	Key_intrecords [ 4] =@"B04";
	Key_intrecords [ 5] =@"B05";
	Key_intrecords [ 6] =@"B06";
	Key_intrecords [ 7] =@"B07";
	Key_intrecords [ 8] =@"B08";
	Key_intrecords [ 9] =@"B09";
	Key_intrecords [10] =@"B10";
	Key_intrecords [11] =@"B11";
	Key_intrecords [12] =@"B12";
	Key_intrecords [13] =@"B13";
	Key_intrecords [14] =@"B14";
	Key_intrecords [15] =@"B15";
	
	Key_boolsetup  [ 0] =@"C00";
	Key_boolsetup  [ 1] =@"C01";
	Key_boolsetup  [ 2] =@"C02";
	
	Key_intvalgame [ 0] =@"D00";
	Key_intvalgame [ 1] =@"D01";
	Key_intvalgame [ 2] =@"D02";
	Key_intvalgame [ 3] =@"D03";
	Key_intvalgame [ 4] =@"D04";
	
	Key_intcomp1   [ 0] =@"E00"; 	Key_intcomp2   [ 0]=@"F00";
	Key_intcomp1   [ 1] =@"E01"; 	Key_intcomp2   [ 1]=@"F01";
	Key_intcomp1   [ 2] =@"E02"; 	Key_intcomp2   [ 2]=@"F02";
	Key_intcomp1   [ 3] =@"E03"; 	Key_intcomp2   [ 3]=@"F03";
	Key_intcomp1   [ 4] =@"E04"; 	Key_intcomp2   [ 4]=@"F04";
	Key_intcomp1   [ 5] =@"E05"; 	Key_intcomp2   [ 5]=@"F05";
	Key_intcomp1   [ 6] =@"E06"; 	Key_intcomp2   [ 6]=@"F06";
	Key_intcomp1   [ 7] =@"E07"; 	Key_intcomp2   [ 7]=@"F07";
	Key_intcomp1   [ 8] =@"E08"; 	Key_intcomp2   [ 8]=@"F08";
	Key_intcomp1   [ 9] =@"E09"; 	Key_intcomp2   [ 9]=@"F09";
	Key_intcomp1   [10] =@"E10"; 	Key_intcomp2   [10]=@"F10";
	Key_intcomp1   [11] =@"E11"; 	Key_intcomp2   [11]=@"F11";
	Key_intcomp1   [12] =@"E12"; 	Key_intcomp2   [12]=@"F12";
	Key_intcomp1   [13] =@"E13"; 	Key_intcomp2   [13]=@"F13";
	Key_intcomp1   [14] =@"E14"; 	Key_intcomp2   [14]=@"F14";
	Key_intcomp1   [15] =@"E15"; 	Key_intcomp2   [15]=@"F15";
	Key_intcomp1   [16] =@"E16"; 	Key_intcomp2   [16]=@"F16";
	Key_intcomp1   [17] =@"E17"; 	Key_intcomp2   [17]=@"F17";
	Key_intcomp1   [18] =@"E18"; 	Key_intcomp2   [18]=@"F18";
	Key_intcomp1   [19] =@"E19"; 	Key_intcomp2   [19]=@"F19";
	
	Key_intlastpalyer   =@"G00";
	
	Key_intrecordlast[0]=@"H00";
	Key_intrecordlast[1]=@"H01";
	Key_intrecordlast[2]=@"H02";
	
	Key_intsetup        =@"I00";
	Key_primaapertura   =@"I01";
	
	Key_intdata[0]      =@"M00";
	Key_intdata[1]      =@"M01";
	Key_intdata[2]      =@"M02";
	Key_intdata[3]      =@"M03";
	Key_intdata[4]      =@"M04";
	Key_intdata[5]      =@"M05";
	Key_intdata[6]      =@"M06";
	Key_intdata[7]      =@"M07";
	Key_intdata[8]      =@"M08";
	Key_intdata[9]      =@"M09";
	Key_intdata[10]     =@"M10";
	Key_intdata[11]     =@"M11";
	Key_intdata[12]     =@"M12";
	Key_intdata[13]     =@"M13";
	Key_intdata[14]     =@"M14";
	Key_intdata[15]     =@"M15";
	Key_intdata[16]     =@"M16";
	Key_intdata[17]     =@"M17";
	Key_intdata[18]     =@"M18";
	Key_intdata[19]     =@"M19";
	Key_intdata[20]     =@"M20";
	Key_intdata[21]     =@"M21";
	Key_intdata[22]     =@"M22";
	
	
	Key_booldata[0]     =@"P00";
	Key_booldata[1]     =@"P01";
	Key_booldata[2]     =@"P02";
	Key_booldata[3]     =@"P03";
	Key_booldata[4]     =@"P04";
	Key_booldata[5]     =@"P05";
	Key_booldata[6]     =@"P06";
	Key_booldata[7]     =@"P07";
	Key_booldata[8]     =@"P08";
	Key_booldata[9]     =@"P09";
	Key_booldata[10]    =@"P10";
	Key_booldata[11]    =@"P11";
	Key_booldata[12]    =@"P12";
	Key_booldata[13]    =@"P13";
	Key_booldata[14]    =@"P14";
	Key_booldata[15]    =@"P15";
	Key_booldata[16]    =@"P16";
	Key_booldata[17]    =@"P17";
	Key_booldata[18]    =@"P18";
	Key_booldata[19]    =@"P19";
	Key_booldata[20]    =@"P20";
	Key_booldata[21]    =@"P21";
	Key_booldata[22]    =@"P22";
	
	
	Key_floatdata[0]    =@"R00";
	Key_floatdata[1]    =@"R01";
	Key_floatdata[2]    =@"R02";
	Key_floatdata[3]    =@"R03";
	Key_floatdata[4]    =@"R04";
	Key_floatdata[5]    =@"R05";
	Key_floatdata[6]    =@"R06";
	Key_floatdata[7]    =@"R07";
	Key_floatdata[8]    =@"R08";
	Key_floatdata[9]    =@"R09";
	Key_floatdata[10]   =@"R10";
	Key_floatdata[11]   =@"R11";
	Key_floatdata[12]   =@"R12";
	Key_floatdata[13]   =@"R13";
	
	
}

- (void) posizionibuche                              {
	ptbuche[0].x=300;	ptbuche[0].y=42;
	ptbuche[1].x=120;	ptbuche[1].y=48;
	ptbuche[2].x=210;	ptbuche[2].y=60;
	ptbuche[3].x=54;	ptbuche[3].y=72;
    ptbuche[4].x=350;	ptbuche[4].y=96;
	ptbuche[5].x=164;	ptbuche[5].y=100;
	ptbuche[6].x=256;	ptbuche[6].y=104;
	ptbuche[7].x=92;	ptbuche[7].y=122;
	ptbuche[8].x =308;	ptbuche[8].y =148;
	ptbuche[9].x =200;	ptbuche[9].y =160;
	ptbuche[10].x=44;	ptbuche[10].y=170;
	ptbuche[11].x=120;	ptbuche[11].y=186;
	ptbuche[12].x=260;	ptbuche[12].y=196;
	ptbuche[13].x=346;	ptbuche[13].y=208;
	ptbuche[14].x=192;	ptbuche[14].y=220;
	ptbuche[15].x=64;	ptbuche[15].y=232;
	ptbuche[16].x=292;	ptbuche[16].y=250;
	ptbuche[17].x=132;	ptbuche[17].y=264;
	ptbuche[18].x=220;	ptbuche[18].y=272;
	ptbuche[19].x=352;	ptbuche[19].y=272;
}

- (void) setupvariabili                              {
	[self setupnomikey];
	[self posizionibuche];
    i_ypostalpinapanel=160;
	pos_butbackmenu.x=410;
	pos_butbackmenu.y=250;
	i_bonustimesveglia=6;
	i_bonustimefruits=5;
	i_xgoingtopanel=30;
	b_mancino=NO;
    b_inpausa=NO;
	f_soundlevel=50.0;
	b_primaapertura=YES;
	
	f_volindice[0]=100.0; // alto
	f_volindice[1]= 35.0; // alto // bonus
	f_volindice[2]=100.0; // alto
	f_volindice[3]= 30.0; // meno
	f_volindice[4]= 60.0;
	f_volindice[5]= 60.0; // meno
	f_volindice[6]=100.0;
	f_volindice[7]= 40.0;
	f_volindice[8]=100.0;
	f_volindice[9]= 50.0;
	
	for (int i=0; i<3; i++) {i_introducedrecord[i]=20;};
    b_fromgameopenrecord=NO;
	b_sobonus1=NO;
	b_sotalpa1=NO;
}

- (void) posizionawievbuche                          {
	[self posizionibuche];
	if (b_mancino) {  for (int i=0; i<NUMMAXBUCHE; i++) { ptbuche[i].x=ptbuche[i].x+img_panlat.size.width; }  }
	for (int i=0; i<NUMMAXBUCHE; i++) { View_buche[i].center=ptbuche[i];  } 
}

- (void) posizionapannellinosxdx     {
	CGPoint locpt;
	
	if (b_mancino) {
		locpt.x=img_panlat.size.width/2; locpt.y=160;
		View_panlat.center=locpt;
	} else {
		locpt.x=480-img_panlat.size.width/2; locpt.y=160;
		View_panlat.center=locpt;
	}
}



- (void) setupsequenze                               {
	sequeszatalpa1[0]=0;
	sequeszatalpa1[1]=1;
	sequeszatalpa1[2]=2;
	sequeszatalpa1[3]=3;
	sequeszatalpa1[4]=4;
	sequeszatalpa1[5]=5;
	sequeszatalpa1[6]=5;
	sequeszatalpa1[7]=4;
	sequeszatalpa1[8]=3;
	sequeszatalpa1[9]=4;
	sequeszatalpa1[10]=6;
	sequeszatalpa1[11]=6;
	sequeszatalpa1[12]=4;
	sequeszatalpa1[13]=3;
	sequeszatalpa1[14]=2;
	sequeszatalpa1[15]=1;
	sequeszatalpa1[16]=0;	
	
	sequeszatalpa2[0]=0;
	sequeszatalpa2[1]=1;
	sequeszatalpa2[2]=2;
	sequeszatalpa2[3]=3;
	sequeszatalpa2[4]=4;
	sequeszatalpa2[5]=5;
	sequeszatalpa2[6]=5;
	sequeszatalpa2[7]=4;
	sequeszatalpa2[8]=3;
	sequeszatalpa2[9]=2;
	sequeszatalpa2[10]=1;
	sequeszatalpa2[11]=0;
	
	sequeszatalpa3[0]=0;
	sequeszatalpa3[1]=1;
	sequeszatalpa3[2]=2;
	sequeszatalpa3[3]=3;
	sequeszatalpa3[4]=4;
	sequeszatalpa3[5]=6;
	sequeszatalpa3[6]=6;
	sequeszatalpa3[7]=4;
	sequeszatalpa3[8]=3;
	sequeszatalpa3[9]=2;
	sequeszatalpa3[10]=1;
	sequeszatalpa3[11]=0;
	
	sequeszatalpa4[0]=0;
	sequeszatalpa4[1]=1;
	sequeszatalpa4[2]=2;
	sequeszatalpa4[3]=3;
	sequeszatalpa4[4]=4;
	sequeszatalpa4[5]=3;
	sequeszatalpa4[6]=4;
	sequeszatalpa4[7]=3;
	sequeszatalpa4[8]=4;
	sequeszatalpa4[9]=3;
	sequeszatalpa4[10]=2;
	sequeszatalpa4[11]=1;
	sequeszatalpa4[12]=0;
	
	
}

- (void) mettiLabelMenu             : (int) lingua   {
	labM[0].text=@"Continue";	
	labM[1].text=@"New Game";	
	labM[2].text=@"Records";	
	labM[3].text=@"Rules";	
	labM[4].text=@"Set Up";	
	labM[5].text=@"info";		
}

- (void) mettiNomiMenu                               {
	for (int i=0; i<3; i++) {  	labM[i].text=String_nomeplayer[i];}
}


- (void) switchmancino                               {
	CGPoint locpt;
	if (b_mancino) {
		b_mancino=NO;
		//		for (int i=0; i<NUMMAXBUCHE; i++) { ptbuche[i].x =ptbuche[i].x-84;	View_buche[i].center =ptbuche[i];  }
		locpt.x=480-img_panlat.size.width/2; locpt.y=160;
		View_panlat.center=locpt;
		i_xgoingtopanel=30;
	}  else
	{
		b_mancino=YES;
		//	   for (int i=0; i<NUMMAXBUCHE; i++) { ptbuche[i].x =ptbuche[i].x+84;	View_buche[i].center =ptbuche[i];  }
		locpt.x=img_panlat.size.width/2; locpt.y=160;
		View_panlat.center=locpt;
		i_xgoingtopanel=-30;
	}
}                          // mancino




- (void) fissavariabiliData                          {	
 	int x1; int y1;
	
	[[NSUserDefaults standardUserDefaults] setInteger:i_indicenomeplayer        forKey:Key_intdata[0] ];
	[[NSUserDefaults standardUserDefaults] setInteger:i_30arrivatasveglia       forKey:Key_intdata[1] ];
	[[NSUserDefaults standardUserDefaults] setInteger:i_30tripletta				forKey:Key_intdata[2] ];
	[[NSUserDefaults standardUserDefaults] setInteger:i_30explosiontime			forKey:Key_intdata[3] ];
	[[NSUserDefaults standardUserDefaults] setInteger:i_30nextbucaappear		forKey:Key_intdata[4] ];
	[[NSUserDefaults standardUserDefaults] setInteger:i_30timesveglia			forKey:Key_intdata[5] ];
	[[NSUserDefaults standardUserDefaults] setInteger:i_30timenextsveglia		forKey:Key_intdata[6] ];
	[[NSUserDefaults standardUserDefaults] setInteger:i_bonustimesveglia		forKey:Key_intdata[7] ];
	[[NSUserDefaults standardUserDefaults] setInteger:i_bonustimefruits			forKey:Key_intdata[8] ];
	
	[[NSUserDefaults standardUserDefaults] setBool:b_arrivatasveglia            forKey:Key_booldata[0] ];
	[[NSUserDefaults standardUserDefaults] setBool:b_inexplosione				forKey:Key_booldata[1] ];
	[[NSUserDefaults standardUserDefaults] setBool:b_presachiara				forKey:Key_booldata[2] ];
	[[NSUserDefaults standardUserDefaults] setBool:b_intripletta				forKey:Key_booldata[3] ];
	[[NSUserDefaults standardUserDefaults] setBool:b_tuttelebuchevisibili		forKey:Key_booldata[4] ];
	[[NSUserDefaults standardUserDefaults] setBool:b_attivasveglia				forKey:Key_booldata[5] ];
	[[NSUserDefaults standardUserDefaults] setBool:b_colpitasveglia				forKey:Key_booldata[6] ];
	[[NSUserDefaults standardUserDefaults] setBool:b_trisnonus[0]				forKey:Key_booldata[7] ];
	[[NSUserDefaults standardUserDefaults] setBool:b_trisnonus[1]				forKey:Key_booldata[8] ];
	[[NSUserDefaults standardUserDefaults] setBool:b_trisnonus[2]				forKey:Key_booldata[9] ];
	
	for (int i=0; i<6; i++) {
		[[NSUserDefaults standardUserDefaults] setBool:b_attivobonus[i]		    forKey:Key_booldata[10+i] ];}
	for (int i=0; i<6; i++) {
		[[NSUserDefaults standardUserDefaults] setBool:b_colpitobonus[i]		forKey:Key_booldata[16+i] ];}
	
	for (int i=0; i<6; i++) {
		[[NSUserDefaults standardUserDefaults] setInteger:i_30timebonus[i]		forKey:Key_intdata[9+i] ];	}
	for (int i=0; i<6; i++) {
		[[NSUserDefaults standardUserDefaults] setInteger:i_30timenextbonus[i]	forKey:Key_intdata[15+i] ];	}
	
	
	for (int i=0; i<6; i++) {
		x1=ptbonus[i].x; y1=ptbonus[i].y;
		[[NSUserDefaults standardUserDefaults] setInteger:x1			forKey:Key_floatdata[i*2] ];
		[[NSUserDefaults standardUserDefaults] setInteger:y1			forKey:Key_floatdata[i*2+1] ];	}
	
	x1=ptsveglia.x; y1=ptsveglia.y;
	[[NSUserDefaults standardUserDefaults] setInteger:x1			forKey:Key_floatdata[12] ];
	[[NSUserDefaults standardUserDefaults] setInteger:y1			forKey:Key_floatdata[13] ];
	
	
	
	
}

- (void) fissavariabiliBuche                         {	
	int locvalue;
	for (int i=0; i<NUMMAXBUCHE; i++) { 
		locvalue=0;
		if (b_bucaAttiva[i])     { locvalue=locvalue+  1; };		
		if (b_talpone[i])        { locvalue=locvalue+ 10; };
		if (b_bucaColpita[i])    { locvalue=locvalue+100; };
		locvalue=locvalue+   1000*i_currentsequenza[i]; 
		if (i_loctimetrafoto[i]>9) {i_loctimetrafoto[i]=9;}		if (i_loctimetrafoto[i]<0) {i_loctimetrafoto[i]=0;}
		locvalue=locvalue+  10000*i_loctimetrafoto[i]; 
		if (i_maxtimetrafoto[i]>9) {i_maxtimetrafoto[i]=9;}		if (i_maxtimetrafoto[i]<0) {i_maxtimetrafoto[i]=0;}
		locvalue=locvalue+ 100000*i_maxtimetrafoto[i]; 
		if (View_buche[i].hidden) {} else  {locvalue=locvalue+1000000;}
		[[NSUserDefaults standardUserDefaults] setInteger:locvalue            forKey:Key_intcomp1 [i] ];
		if (i_currentfoto[i]<0) {i_currentfoto[i]=99;};
		if (i_currentfoto[i]>99) {i_currentfoto[i]=99;};
		locvalue=i_currentfoto[i];
		if (i_30timenext[i]<0) {i_30timenext[i]=0;};
		locvalue=locvalue+100*i_30timenext[i];
		[[NSUserDefaults standardUserDefaults] setInteger:locvalue            forKey:Key_intcomp2 [i] ];
	}
}

- (void) fissavariabili                              {	
	for (int i=0; i<3;  i++) {  [[NSUserDefaults standardUserDefaults] setObject :String_nomeplayer[i]  forKey:Key_nomeplayer[i]];	}
	for (int i=0; i<16; i++) {  [[NSUserDefaults standardUserDefaults] setObject :Str_nomirecords[i]    forKey:Key_nomerecords[i]];	}
	for (int i=0; i<16; i++) {  [[NSUserDefaults standardUserDefaults] setInteger:i_pointrecords[i]     forKey:Key_intrecords[i]];	}
	
	
	[[NSUserDefaults standardUserDefaults] setBool:b_mancino             forKey:Key_boolsetup [0] ];
	[[NSUserDefaults standardUserDefaults] setBool:b_inpausa             forKey:Key_boolsetup [1] ];
	[[NSUserDefaults standardUserDefaults] setBool:b_gameover            forKey:Key_boolsetup [2] ];
	
	[[NSUserDefaults standardUserDefaults] setInteger:i_gamelevel        forKey:Key_intvalgame [0] ];
	[[NSUserDefaults standardUserDefaults] setInteger:i_numbonus         forKey:Key_intvalgame [1] ];
	[[NSUserDefaults standardUserDefaults] setInteger:i_numtalpeprese    forKey:Key_intvalgame [2] ];
	[[NSUserDefaults standardUserDefaults] setInteger:i_numsecondigame   forKey:Key_intvalgame [3] ];
	[[NSUserDefaults standardUserDefaults] setInteger:i_punti            forKey:Key_intvalgame [4] ];
	
	[[NSUserDefaults standardUserDefaults] setInteger:i_indicenomeplayer forKey:Key_intlastpalyer  ];
	b_primaapertura=YES;
	[[NSUserDefaults standardUserDefaults] setBool:b_primaapertura       forKey:Key_primaapertura ];
	
	
	for (int i=0; i<3;  i++) {  [[NSUserDefaults standardUserDefaults] setInteger :i_UltimoRecord[i]  forKey:Key_intrecordlast[i]];	}
	
	[[NSUserDefaults standardUserDefaults] setFloat:f_soundlevel forKey:Key_intsetup  ];
	
	
	
    [self fissavariabiliBuche];
	[self fissavariabiliData];
	
	
}                          // salvataggio dati

- (void) Inverti_fissavariabiliData                  {
	int x1; int y1;
	
	i_indicenomeplayer  = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intdata[0] ];
	i_30arrivatasveglia = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intdata[1] ];
	i_30tripletta       = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intdata[2] ];
	i_30explosiontime   = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intdata[3] ];
	i_30nextbucaappear  = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intdata[4] ];
	i_30timesveglia     = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intdata[5] ];
	i_30timenextsveglia = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intdata[6] ];
	//	i_bonustimesveglia  = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intdata[7] ];
	//	i_bonustimefruits   = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intdata[8] ];
	b_arrivatasveglia   = [[NSUserDefaults standardUserDefaults] boolForKey:Key_booldata [0] ];
	b_inexplosione      = [[NSUserDefaults standardUserDefaults] boolForKey:Key_booldata [1] ];
	b_presachiara       = [[NSUserDefaults standardUserDefaults] boolForKey:Key_booldata [2] ];
	b_intripletta       = [[NSUserDefaults standardUserDefaults] boolForKey:Key_booldata [3] ];
	b_tuttelebuchevisibili  = [[NSUserDefaults standardUserDefaults] boolForKey:Key_booldata [4] ];
  	b_attivasveglia     = [[NSUserDefaults standardUserDefaults] boolForKey:Key_booldata [5] ];
	b_colpitasveglia    = [[NSUserDefaults standardUserDefaults] boolForKey:Key_booldata [6] ];
	b_trisnonus[0]      = [[NSUserDefaults standardUserDefaults] boolForKey:Key_booldata [7] ];
	b_trisnonus[1]      = [[NSUserDefaults standardUserDefaults] boolForKey:Key_booldata [8] ];
	b_trisnonus[2]      = [[NSUserDefaults standardUserDefaults] boolForKey:Key_booldata [9] ];
	
	for (int i=0; i<6; i++) {
		b_attivobonus[i]      = [[NSUserDefaults standardUserDefaults] boolForKey:Key_booldata [10+i] ];	}
	for (int i=0; i<6; i++) {
		b_colpitobonus[i]     = [[NSUserDefaults standardUserDefaults] boolForKey:Key_booldata [16+i] ];    }
	for (int i=0; i<6; i++) {
		i_30timebonus[i]      = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intdata[9+i] ];	}	
	for (int i=0; i<6; i++) {
		i_30timenextbonus[i]  = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intdata[15+i] ];	}	
	
	for (int i=0; i<6; i++) {
		x1  = [[NSUserDefaults standardUserDefaults] integerForKey:Key_floatdata[i*2] ];		
	    y1  = [[NSUserDefaults standardUserDefaults] integerForKey:Key_floatdata[i*2+1] ];	
		ptbonus[i].x=x1; ptbonus[i].y=y1;	}
	
	x1  = [[NSUserDefaults standardUserDefaults] integerForKey:Key_floatdata[12] ];		
	y1  = [[NSUserDefaults standardUserDefaults] integerForKey:Key_floatdata[13] ];	
	
	ptsveglia.x=x1; ptsveglia.y=y1;
	
	
	
	
}

- (void) Inverti_fissavariabiliBuche                 {	
	int locvalue;
	div_t loc_t; 
	
	for (int i=0; i<20; i++) { 
		locvalue = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intcomp1[i]];  
		loc_t = div (locvalue,10);	if (loc_t.rem>0) {b_bucaAttiva[i]  =YES;} else {b_bucaAttiva[i]  =NO;}		locvalue=loc_t.quot;
		loc_t = div (locvalue,10);	if (loc_t.rem>0) {b_talpone[i]     =YES;} else {b_talpone[i]     =NO;}		locvalue=loc_t.quot;
		loc_t = div (locvalue,10);	if (loc_t.rem>0) {b_bucaColpita[i] =YES;} else {b_bucaColpita[i] =NO;}		locvalue=loc_t.quot;
		loc_t = div (locvalue,10);	i_currentsequenza[i] =loc_t.rem;											locvalue=loc_t.quot;
		loc_t = div (locvalue,10);	i_loctimetrafoto[i]  =loc_t.rem;											locvalue=loc_t.quot;
		loc_t = div (locvalue,10);	i_maxtimetrafoto[i]  =loc_t.rem;											locvalue=loc_t.quot;
		loc_t = div (locvalue,10);	if (loc_t.rem>0) {View_buche[i].hidden=NO;} else {View_buche[i].hidden=YES;}	
		locvalue = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intcomp2[i]];  
		loc_t = div (locvalue,100);	i_currentfoto[i] =loc_t.rem;          i_30timenext[i]=loc_t.quot;
	}
}

- (void) Inverti_fissavariabili                      {
	NSString    *str_result;
	CGPoint locpt; 
	for (int i=0; i<3; i++) {  
		str_result = [[NSUserDefaults standardUserDefaults] objectForKey:Key_nomeplayer[i]];		String_nomeplayer[i]=str_result;
		textFieldNomi[i].text=String_nomeplayer[i];		 }
	
	for (int i=0; i<16; i++)  { 
		i_pointrecords[i] = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intrecords[i]];  
		str_result = [NSString stringWithFormat:@"%i", i_pointrecords[i]];
	    Label_recordpoints[i].text=     str_result;
	}
	
	for (int i=0; i<16; i++)  { 
		str_result = [[NSUserDefaults standardUserDefaults] objectForKey:Key_nomerecords[i]];       Str_nomirecords[i]=str_result;  
		if (i_pointrecords[i]==0) { Label_records[i+4].text=@"----"; } else {	Label_records[i+4].text=Str_nomirecords[i];}
	}
	b_mancino  = [[NSUserDefaults standardUserDefaults] boolForKey:Key_boolsetup [0] ];
	b_inpausa  = [[NSUserDefaults standardUserDefaults] boolForKey:Key_boolsetup [1] ];
	b_gameover = [[NSUserDefaults standardUserDefaults] boolForKey:Key_boolsetup [2] ];
	
	
	i_gamelevel      = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intvalgame [0] ];
	i_numbonus       = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intvalgame [1] ];
	i_numtalpeprese  = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intvalgame [2] ];
	i_numsecondigame = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intvalgame [3] ];
	i_punti          = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intvalgame [4] ];
	
	i_indicenomeplayer  = [[NSUserDefaults standardUserDefaults] integerForKey:Key_intlastpalyer ];
	
	for (int i=0; i<3;  i++) { 
		i_UltimoRecord[i]= [[NSUserDefaults standardUserDefaults] integerForKey:Key_intrecordlast[i]];	}
	
	f_soundlevel     = [[NSUserDefaults standardUserDefaults] floatForKey:Key_intsetup   ];
	b_primaapertura  = [[NSUserDefaults standardUserDefaults] boolForKey:Key_primaapertura ];
	
	
	if (!b_primaapertura) {f_soundlevel=50.0;};
	
	if (b_mancino) {locpt.x=240+40;} else {locpt.x=240-40;};  locpt.y=160;
	View_gameOver.center=locpt;
	
	[self Inverti_fissavariabiliBuche];
	[self Inverti_fissavariabiliData];
	
	
	for (int i=0; i<3; i++) { if (b_trisnonus[i]) View_littlebonus[i].hidden=NO;   }
	
	for (int i=0; i<NUMMAXBUCHE; i++) { View_talpabuche[i].image=nil; 	}
	
	for (int i=0; i<6; i++) { if (b_attivobonus[i])
	{ View_bonus[i].hidden=NO;   
		View_bonus[i].center=ptbonus[i];
	}
	}
	
	//	View_sveglia.hidden=NO;
	if (b_attivasveglia) {	View_sveglia.center=ptsveglia;	View_sveglia.hidden=NO;}
	
	
}






- (void) loadDigits                                  {
	img_digits[0]  = [UIImage imageNamed:@"d0.png"];
	img_digits[1]  = [UIImage imageNamed:@"d1.png"];
	img_digits[2]  = [UIImage imageNamed:@"d2.png"];
	img_digits[3]  = [UIImage imageNamed:@"d3.png"];
	img_digits[4]  = [UIImage imageNamed:@"d4.png"];
	img_digits[5]  = [UIImage imageNamed:@"d5.png"];
	img_digits[6]  = [UIImage imageNamed:@"d6.png"];
	img_digits[7]  = [UIImage imageNamed:@"d7.png"];
	img_digits[8]  = [UIImage imageNamed:@"d8.png"];
	img_digits[9]  = [UIImage imageNamed:@"d9.png"];
	img_digits[10] = [UIImage imageNamed:@"dp.png"];
}

- (void) loadMenu                                    {
	// Pagina1   messa come prima in view 
	// contiene sfondo ed opzioni del menu.
	CGRect  fr;
	fr.origin.x=0;      	fr.origin.y=0;
	fr.size.width=480;	    fr.size.height=320;	
	Pagina1 = [[UIImageView alloc] initWithFrame:fr];    Pagina1.image=nil;   Pagina1.hidden=NO;
	[self.view addSubview: Pagina1];	
	
	// in Pagina1 lo sfondo del menu
	img_sfondomenu  = [UIImage imageNamed:@"backmenu.png"];
    View_sfondomenu = [[UIImageView alloc] initWithImage: img_sfondomenu]; 
    [Pagina1 addSubview: View_sfondomenu];
	
	// le opzioni fatte da base_img e label sopra
	CGPoint locpt;
	locpt.x=240;  locpt.y=0;
	img_opzione     = [UIImage imageNamed:@"opz.png"];	
	img_opzioneh    = [UIImage imageNamed:@"opzh.png"];
	i_dimx2opzmenu   = img_opzione.size.width/2;
	i_dimy2opzmenu   = img_opzione.size.height/2;
	
	for (int i=NUMLABELMENU-1; i>=0; i--) {  View_opzionemenu[i]=[[UIImageView alloc] initWithImage: img_opzione   highlightedImage:  img_opzioneh]; 
	    [Pagina1 addSubview: View_opzionemenu[i]]; 	
		View_opzionemenu[i].center=locpt;
	}		
	
	for (int i=0; i<NUMLABELMENU; i++) { 
		labM[i] = [[UILabel alloc] initWithFrame:CGRectMake(10, 38, 120.0, 20.0)];
		labM[i].textColor = [UIColor blackColor];
		labM[i].backgroundColor = [UIColor clearColor];
		labM[i].textAlignment = UITextAlignmentCenter;	
		labM[i].hidden=NO;
		[View_opzionemenu[i] addSubview: labM[i]];	
	}
	
	
	CGRect frame = CGRectMake(0.0, 0.0, 160, 40);
	locpt.x=240;  locpt.y=-50;
	
	for (int i=0; i<3; i++) { 
		textFieldNomi[i] = [[UITextField alloc] initWithFrame:frame];
		textFieldNomi[i].backgroundColor = [UIColor clearColor];
		textFieldNomi[i].textColor = [UIColor blackColor];
		textFieldNomi[i].placeholder   = @"<Insert Name>";
		textFieldNomi[i].keyboardType  = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
		textFieldNomi[i].returnKeyType = UIReturnKeyDone;
		textFieldNomi[i].textAlignment = UITextAlignmentCenter;
		textFieldNomi[i].delegate = self;	 // let us be the delegate so we know when the keyboard's "Done" button is pressed
		textFieldNomi[i].autocorrectionType = UITextAutocorrectionTypeNo;	// no auto correction support
		textFieldNomi[i].hidden=YES;
		textFieldNomi[i].center=locpt;
		[self.view addSubview: textFieldNomi[i]];
	}
	
	
}

- (void) settavolumi                                 {
	for (int i=0; i<NUMSOUNDS; i++) { 
		effectPlayer[i].volume=(f_soundlevel*f_volindice[i])/10000;
		//		div ((i_soundlevel*i_volindice[i]) , 10000);
	}
}

- (void) initSound                                   {
	NSBundle *mainBundle1 = [NSBundle mainBundle];
	NSBundle *mainBundle2 = [NSBundle mainBundle];
	NSBundle *mainBundle3 = [NSBundle mainBundle];
	NSBundle *mainBundle4 = [NSBundle mainBundle];
	NSBundle *mainBundle5 = [NSBundle mainBundle];
	NSBundle *mainBundle6 = [NSBundle mainBundle];
	NSBundle *mainBundle7 = [NSBundle mainBundle];
	NSBundle *mainBundle8 = [NSBundle mainBundle];
	
	NSURL *tickURL[NUMSOUNDS];
	
	//	NSThread *soundPlayerThread;
	//	AVAudioPlayer *effectPlayer[9];
	
	tickURL[0]      = [NSURL fileURLWithPath:[mainBundle1 pathForResource:@"bomb"      ofType:@"caf"]];  
	tickURL[1]      = [NSURL fileURLWithPath:[mainBundle4 pathForResource:@"bonus"     ofType:@"caf"]];  
	tickURL[2]      = [NSURL fileURLWithPath:[mainBundle3 pathForResource:@"gameover"  ofType:@"caf"]];           
	tickURL[3]      = [NSURL fileURLWithPath:[mainBundle2 pathForResource:@"gotit"     ofType:@"caf"]];           
	tickURL[4]      = [NSURL fileURLWithPath:[mainBundle7 pathForResource:@"gotit"     ofType:@"caf"]];           
	tickURL[5]      = [NSURL fileURLWithPath:[mainBundle6 pathForResource:@"sbagliato" ofType:@"caf"]];           
	tickURL[6]      = [NSURL fileURLWithPath:[mainBundle3 pathForResource:@"second"    ofType:@"caf"]];           
	tickURL[7]      = [NSURL fileURLWithPath:[mainBundle5 pathForResource:@"sveglia"   ofType:@"caf"]];           
	tickURL[8]      = [NSURL fileURLWithPath:[mainBundle3 pathForResource:@"Trebonus"  ofType:@"caf"]];   
	tickURL[9]      = [NSURL fileURLWithPath:[mainBundle8 pathForResource:@"bonus"     ofType:@"caf"]];  
	
	
	for (int i=0; i<NUMSOUNDS; i++) {  
		effectPlayer[i] = [[AVAudioPlayer alloc] initWithContentsOfURL:tickURL[i] error:nil];
		effectPlayer[i].volume=0.70;
		[effectPlayer[i] prepareToPlay];		
	}
	
	effectPlayer[0].volume=1.00;
	
	
	
	for(int i=0; i<NUMSOUNDS   ;i++)  { tickURL[i]=nil;}
	
	[mainBundle1 release];
	[mainBundle2 release];
	[mainBundle3 release];
	[mainBundle4 release];
	[mainBundle5 release];
	[mainBundle6 release];
	[mainBundle7 release];
	[mainBundle8 release];
	[self settavolumi];
}

- (void) Suona                           : (int) ind {
	// se e' talpa o bonus si puo' cambiare indice perche' gia' in possibile sound
	if (ind==3)  { if (b_sotalpa1) { ind=4; b_sotalpa1=NO; } else {b_sotalpa1=YES; }	}
	if (ind==1)  { if (b_sobonus1) { ind=9; b_sobonus1=NO; } else {b_sobonus1=YES; }	}
	[ effectPlayer[ind]     play];
}





- (BOOL)textFieldShouldReturn:(UITextField *)textField  {
	// the user pressed the "Done" button, so dismiss the keyboard
	[textField resignFirstResponder];
	for (int i=0; i<3; i++) { String_nomeplayer[i]=textFieldNomi[i].text; }
	i_indicenomeplayer=0;
	for (int i=0; i<3; i++) { if (textField==textFieldNomi[i])  {  i_indicenomeplayer=i;   };	}
    [self fissavariabili];
	if ( [String_nomeplayer[i_indicenomeplayer] length]==0) {
		[self p_StartMenuOpen];
	} else {
		[self NewGameSetUp ];   
		[self p_StartContinueOpen];}
	return YES;
}   // il ritorno al textinserimento



- (void) loadgraficagame                             {
	CGRect  fr;	    CGPoint locpt; 
	
	fr.origin.x=0;      	fr.origin.y=0;
	fr.size.width=480;	    fr.size.height=320;		
	Pagina2 = [[UIImageView alloc] initWithFrame:fr];    Pagina2.image=nil;   Pagina2.hidden=NO;
	Pagina3 = [[UIImageView alloc] initWithFrame:fr];    Pagina3.image=nil;   Pagina3.hidden=NO;
	Pagina4 = [[UIImageView alloc] initWithFrame:fr];    Pagina4.image=nil;   Pagina4.hidden=NO;
	Pagina5 = [[UIImageView alloc] initWithFrame:fr];    Pagina5.image=nil;   Pagina5.hidden=NO;
	
	[self.view addSubview: Pagina2];	
	[self.view addSubview: Pagina3];	
	[self.view addSubview: Pagina4];	
	[self.view addSubview: Pagina5];	
	
	
	
	img_sfondogame  = [UIImage imageNamed:@"fondo.png"];
    View_sfondogame = [[UIImageView alloc] initWithImage: img_sfondogame]; 
	locpt.x=240; locpt.y=-160;
	Pagina2.center=locpt;
	Pagina2.hidden  = NO;
	[Pagina2 addSubview: View_sfondogame];
	
	img_buca        = [UIImage imageNamed:@"buca.png"];
	img_talpa[0]    = [UIImage imageNamed:@"talpa_1.png"];
	img_talpa[1]    = [UIImage imageNamed:@"talpa_2.png"];
	img_talpa[2]    = [UIImage imageNamed:@"talpa_3.png"];
	img_talpa[3]    = [UIImage imageNamed:@"talpa_4.png"];
	img_talpa[4]    = [UIImage imageNamed:@"talpa_5.png"];
	img_talpa[5]    = [UIImage imageNamed:@"talpa_6.png"];
	img_talpa[6]    = [UIImage imageNamed:@"talpa_7.png"];
	
	img_talpah[0]    = [UIImage imageNamed:@"talpah_1.png"];
	img_talpah[1]    = [UIImage imageNamed:@"talpah_2.png"];
	img_talpah[2]    = [UIImage imageNamed:@"talpah_3.png"];
	img_talpah[3]    = [UIImage imageNamed:@"talpah_4.png"];
	img_talpah[4]    = [UIImage imageNamed:@"talpah_5.png"];
	img_talpah[5]    = [UIImage imageNamed:@"talpah_6.png"];
	img_talpah[6]    = [UIImage imageNamed:@"talpah_7.png"];	
	
	
	for (int i=0; i<NUMMAXBUCHE; i++) {  
		View_buche[i]      = [[UIImageView alloc] initWithImage: img_buca]; 
		View_talpabuche[i] = [[UIImageView alloc] initWithImage: img_talpa[0]]; 
		[View_buche[i]  addSubview: View_talpabuche[i]];
		View_buche[i].center =ptbuche[i];
		[Pagina2 addSubview: View_buche[i]];
    }
	
	for (int i=0; i<3; i++) {  
		View_3talpe[i]     = [[UIImageView alloc] initWithImage: img_talpa[1]]; 
		[Pagina2 addSubview: View_3talpe[i]];
		View_3talpe[i].hidden=YES;
	}
	
	
	img_sveglia     = [UIImage imageNamed:@"sveglia.png"];
	View_sveglia    = [[UIImageView alloc] initWithImage: img_sveglia]; 
	[Pagina2 addSubview: View_sveglia];
	View_sveglia.transform =  CGAffineTransformMakeScale(0.5, 0.5);
    View_sveglia.center=ptbuche[9];
	View_sveglia.hidden=YES;
	b_attivasveglia=NO;
	b_colpitasveglia=NO;
	
	img_bonus[0]     = [UIImage imageNamed:@"bonus1.png"];
	img_bonus[1]     = [UIImage imageNamed:@"bonus2.png"];
	img_bonus[2]     = [UIImage imageNamed:@"bonus3.png"];
	img_bonus[3]     = [UIImage imageNamed:@"bonus1h.png"];
	img_bonus[4]     = [UIImage imageNamed:@"bonus2h.png"];
	img_bonus[5]     = [UIImage imageNamed:@"bonus3h.png"];
	
	for (int i=0; i<6; i++) {    // ci saranno i bonus sbaglaiti
		View_bonus[i] = [[UIImageView alloc] initWithImage: img_bonus[i]]; 
		View_bonus[i].transform =  CGAffineTransformMakeScale(0.7, 0.7);
		[Pagina2 addSubview: View_bonus[i]];
	}
	for (int i=3; i<6; i++) { 
		View_bonus[i].transform =  CGAffineTransformMakeScale(0.6, 0.6);
	}
	
	img_gameOver  = [UIImage imageNamed:@"gameover.png"];
	fr.origin.x=0;      fr.origin.y=0;	fr.size.width=img_gameOver.size.width;	fr.size.height=img_gameOver.size.height;
	View_gameOver = [[UIImageView alloc] initWithFrame:fr];
	locpt.x=240;											locpt.y=160;
	if (b_mancino) {locpt.x=240+40;} else {locpt.x=240-40;}
	View_gameOver.center=locpt;
	View_gameOver.image=img_gameOver;
	View_gameOver.hidden=YES;
	[Pagina2 addSubview: View_gameOver];	
	
}

- (void) loadpannelli                                {
	//sulle pagine 4 e 5 la 4 puo' essere piu' trasparente
	CGPoint locpt;
	img_panel = [UIImage imageNamed:@"panel.png"];
	View_panel = [[UIImageView alloc] initWithImage: img_panel];  
	locpt.x=240; locpt.y=160;
	View_panel.center=locpt;
	[Pagina3 addSubview: View_panel];
	View_panel.hidden=YES;
	View_panel.alpha=0.9;
	
	
	img_panlat   = [UIImage imageNamed:@"panlat.png"];
	View_panlat  = [[UIImageView alloc] initWithImage: img_panlat]; 
	locpt.x=480-img_panlat.size.width/2; locpt.y=160;
	View_panlat.center=locpt;
	[Pagina2 addSubview: View_panlat];
	
	img_talpanel = [UIImage imageNamed:@"talpanel.png"];
	View_talpanel= [[UIImageView alloc] initWithImage: img_talpanel]; 
	locpt.x=img_panlat.size.width/2; locpt.y=145;
    View_talpanel.center=locpt;
	[View_panlat  addSubview: View_talpanel];
	
	img_pauselat = [UIImage imageNamed:@"pause.png"];	
	img_pausehlat= [UIImage imageNamed:@"pauseh.png"];
	View_pauselat= [[UIImageView alloc] initWithImage: img_pauselat  highlightedImage:img_pausehlat ]; 
	
	img_coin     = [UIImage imageNamed:@"coin.png"];
	View_coin    = [[UIImageView alloc] initWithImage: img_coin   ]; 		   		   
	[View_panlat  addSubview: View_coin];
	locpt.x=18; locpt.y=296;
	View_coin.transform=  CGAffineTransformMakeScale(0.6, 0.6);
    View_coin.center=locpt;
	
	// qui controllare se mancino o meno
	i_butpausepanel2=img_pauselat.size.width/2;
	pos_butpausepanel.x=6+i_butpausepanel2;
    pos_butpausepanel.y=6+i_butpausepanel2;	
    View_pauselat.center=pos_butpausepanel;
	[View_panlat  addSubview: View_pauselat];
	
	
	img_backlat = [UIImage imageNamed:@"back.png"];	
	img_backhlat= [UIImage imageNamed:@"backh.png"];
	View_backlat= [[UIImageView alloc] initWithImage: img_backlat  highlightedImage:img_backhlat ]; 
	i_butbackpanel2=img_backlat.size.width/2;
	pos_butbackpanel.x=42+i_butbackpanel2;
	pos_butbackpanel.y=6+i_butbackpanel2;
	View_backlat.center=pos_butbackpanel;
	[View_panlat  addSubview: View_backlat];
	
	// svegliuccia
	View_sveglialat    = [[UIImageView alloc] initWithImage: img_sveglia]; 
	[View_panlat  addSubview: View_sveglialat];
	View_sveglialat.transform =  CGAffineTransformMakeScale(0.4, 0.4);
	locpt.x=img_panlat.size.width/2; locpt.y=75;
	View_sveglialat.center=locpt;
	
	// esplosioncina
	img_esposione      = [UIImage imageNamed:@"bomb.png"];    	
	View_esplosione    = [[UIImageView alloc] initWithImage: img_esposione ]; 
   	[View_panlat  addSubview: View_esplosione];
	View_esplosione.transform =  CGAffineTransformMakeScale(0.35, 0.35);
	locpt.x=img_panlat.size.width/2; locpt.y=220;
	View_esplosione.center=locpt;
    View_esplosione.hidden=YES;
	
	
	
	i_dimbutbackmenu2=(img_backlat.size.width);
	View_backbut        = [[UIImageView alloc] initWithImage: img_backlat   highlightedImage: img_backhlat ]; 
	View_backbut.center = pos_butbackmenu;
	[View_panel  addSubview: View_backbut];
	
	
	CGRect  fr;	
	fr.origin.x=0;      	                        fr.origin.y=0;                                               // View_digitnumtalpe[6]
	fr.size.width=img_digits[0].size.width*5;	    fr.size.height=img_digits[0].size.height;
    View_digitnumtalpe[0] = [[UIImageView alloc] initWithFrame:fr];
	fr.size.width=img_digits[0].size.width;
	for(int i=1; i<6   ;i++)  { View_digitnumtalpe[i] = [[UIImageView alloc] initWithFrame:fr]; 
		[View_digitnumtalpe[0]  addSubview: View_digitnumtalpe[i]];	
	}
	locpt.x=(img_panlat.size.width-img_digits[0].size.width/2)-4; locpt.y=img_digits[0].size.height/2;
    for(int i=1; i<4   ;i++)  {  View_digitnumtalpe[i].center=locpt; locpt.x=locpt.x-img_digits[0].size.width*0.75;  }
	locpt.x=locpt.x+img_digits[0].size.width*0.15;
	View_digitnumtalpe[5].center=locpt;               View_digitnumtalpe[5].image=img_digits[10];
	locpt.x=locpt.x-img_digits[0].size.width*0.60;
	View_digitnumtalpe[4].center=locpt;            
	[View_panlat  addSubview: View_digitnumtalpe[0]];
	locpt.x=img_panlat.size.width/2+10;  locpt.y=180;
	View_digitnumtalpe[0].center=locpt;            
	
	
	
	fr.origin.x=0;      	                    fr.origin.y=0;                                               // View_digittime[5]
	fr.size.width=img_digits[0].size.width*4;	fr.size.height=img_digits[0].size.height;
    View_digittime[0] = [[UIImageView alloc] initWithFrame:fr];
	fr.size.width=img_digits[0].size.width;
	for(int i=1; i<5   ;i++)  { View_digittime[i] = [[UIImageView alloc] initWithFrame:fr];
		[View_digittime[0]  addSubview: View_digittime[i]]; 
	}
	locpt.x=(img_panlat.size.width-img_digits[0].size.width/2)-4; locpt.y=img_digits[0].size.height/2;
    for(int i=1; i<3   ;i++)  { View_digittime[i].center=locpt; locpt.x=locpt.x-img_digits[0].size.width*0.75;  }
	locpt.x=locpt.x+img_digits[0].size.width*0.15;
	View_digittime[4].center=locpt;               View_digittime[4].image=img_digits[10];
	locpt.x=locpt.x-img_digits[0].size.width*0.60;
	View_digittime[3].center=locpt;            
	[View_panlat  addSubview: View_digittime[0]];
	locpt.x=img_panlat.size.width/2-10;  locpt.y=100;
	View_digittime[0].center=locpt;            
	
	
	
	fr.origin.x=0;      	                    fr.origin.y=0;                                               // View_digitbonus[6]
	fr.size.width=img_digits[0].size.width*5;	    fr.size.height=img_digits[0].size.height;
    View_digitbonus[0] = [[UIImageView alloc] initWithFrame:fr];
	fr.size.width=img_digits[0].size.width;
	for(int i=1; i<6   ;i++)  { View_digitbonus[i] = [[UIImageView alloc] initWithFrame:fr];
		[View_digitbonus[0]  addSubview: View_digitbonus[i]]; 
	}
	locpt.x=(img_panlat.size.width-img_digits[0].size.width/2)-4; locpt.y=img_digits[0].size.height/2;
    for(int i=1; i<4   ;i++)  {  View_digitbonus[i].center=locpt; locpt.x=locpt.x-img_digits[0].size.width*0.75;  }
	locpt.x=locpt.x+img_digits[0].size.width*0.15;
	View_digitbonus[5].center=locpt;               View_digitbonus[5].image=img_digits[10];
	locpt.x=locpt.x-img_digits[0].size.width*0.60;
	View_digitbonus[4].center=locpt;            
	[View_panlat  addSubview: View_digitbonus[0]];
	locpt.x=img_panlat.size.width/2+10;  locpt.y=250;
	View_digitbonus[0].center=locpt;           
	
	
	
	fr.origin.x=0;      	                    fr.origin.y=0;                                               // View_digitpunti[8]
	fr.size.width=img_digits[0].size.width*7;	    fr.size.height=img_digits[0].size.height;
    View_digitpunti[0] = [[UIImageView alloc] initWithFrame:fr];
	fr.size.width=img_digits[0].size.width;
	for(int i=1; i<8   ;i++)  { View_digitpunti[i] = [[UIImageView alloc] initWithFrame:fr];
		[View_digitpunti[0]  addSubview: View_digitpunti[i]]; 
	}
	locpt.x=(img_panlat.size.width-img_digits[0].size.width/2)-4; locpt.y=img_digits[0].size.height/2;
    for(int i=1; i<4   ;i++)  {  View_digitpunti[i].center=locpt; locpt.x=locpt.x-img_digits[0].size.width*0.75;  }
	locpt.x=locpt.x+img_digits[0].size.width*0.15;
	View_digitpunti[7].center=locpt;               View_digitpunti[7].image=img_digits[10];
	locpt.x=locpt.x-img_digits[0].size.width*0.60;
	for(int i=4; i<7   ;i++)  { View_digitpunti[i].center=locpt; locpt.x=locpt.x-img_digits[0].size.width*0.75;  }           
	[View_panlat  addSubview: View_digitpunti[0]];
	locpt.x=img_panlat.size.width/2+25;  locpt.y=296;
	View_digitpunti[0].center=locpt;           
	View_digitpunti[0].transform =  CGAffineTransformMakeScale(0.8, 0.8);
	
	
    for(int i=0; i<3   ;i++)  { View_littlebonus[i] = [[UIImageView alloc] initWithImage: img_bonus[i]]; 
		View_littlebonus[i].transform=  CGAffineTransformMakeScale(0.5, 0.5);
		[View_panlat  addSubview: View_littlebonus[i]];
		View_littlebonus[i].hidden=YES;
	}
	locpt.y=220;
	locpt.x=20;   View_littlebonus[0].center=locpt;
	locpt.x=40;   View_littlebonus[1].center=locpt;
	locpt.x=60;   View_littlebonus[2].center=locpt;
	
	
	
	
	View_panelerase = [[UIImageView alloc] initWithImage: img_panel];  
	locpt.x=240; locpt.y=160;
	View_panelerase.center=locpt;
	[Pagina3 addSubview: View_panelerase];
	View_panelerase.transform =  CGAffineTransformMakeScale(0.7, 0.6);
	View_panelerase.hidden=YES;
	
	
	locpt.x=10; locpt.y=10;
	Laberase1 = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200.0, 60.0)];
	Laberase2 = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200.0, 60.0)];
	Laberase1.backgroundColor = [UIColor clearColor];
	Laberase2.backgroundColor = [UIColor clearColor];
	Laberase1.textColor = [UIColor blackColor];
	Laberase2.textColor = [UIColor blackColor];
	
	locpt.x=240; 
	Laberase1.text=@"Do You Want";   
	locpt.y=115;
	Laberase1.center=locpt;
	Laberase1.textAlignment = UITextAlignmentCenter;	
	locpt.y=150;
	Laberase2.text=@"Erase all Records ?";   
	
	Laberase2.center=locpt;
	Laberase2.textAlignment = UITextAlignmentCenter;	
	[self.view addSubview: Laberase1];
	[self.view addSubview: Laberase2];
	Laberase1.hidden=YES;
	Laberase2.hidden=YES;
	
	
	
	
}

- (void) loadlabelpannelli                           {
	CGPoint locpt;
	UIFont *TitleFont    = [UIFont fontWithName:@"Arial" size:32];
	UIFont *subtitleFont = [UIFont fontWithName:@"Arial" size:25];
	UIFont *TutorialFont = [UIFont fontWithName:@"Arial" size:18];
	
	
	// Info
	for(int i=0; i<5   ;i++)  {
		Label_info[i] = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 400.0, 60.0)];
		Label_info[i].textColor = [UIColor blackColor];
		Label_info[i].backgroundColor = [UIColor clearColor];
		Label_info[i].textAlignment = UITextAlignmentCenter;	
		[View_panel addSubview: Label_info[i]];	
		Label_info[i].hidden=YES;
	}
	Label_info[0].text=@"Info";             	     locpt.x=img_panel.size.width/2;	locpt.y=50;   Label_info[0].center=locpt;
	Label_info[0].font=TitleFont;
	Label_info[1].text=@"(c)   2010  Carlo Macor";	 locpt.x=img_panel.size.width/2;	locpt.y=230;   Label_info[1].center=locpt;
	
	
//	Label_info[2].text=@"http://www.carlomacor.com/iMole.html";
	Label_info[2].text=@"";

	locpt.x=img_panel.size.width/2;	locpt.y=110;   Label_info[2].center=locpt;
	Label_info[3].text=@"contact :";
	locpt.x=img_panel.size.width/2;	locpt.y=160;   Label_info[3].center=locpt;
	Label_info[4].text=@"carlomacor@carlomacor.com";
	locpt.x=img_panel.size.width/2;	locpt.y=180;   Label_info[4].center=locpt;
	
	
	// records
	for(int i=0; i<20   ;i++)  {
		Label_records[i] = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200.0, 60.0)];
		Label_records[i].textColor = [UIColor blackColor];
		Label_records[i].backgroundColor = [UIColor clearColor];
		Label_records[i].textAlignment = UITextAlignmentCenter;	
		[View_panel addSubview: Label_records[i]];	
	}   
	Label_records[0].text=@"Records";             	     locpt.x=img_panel.size.width/2;	    locpt.y=35;  Label_records[0].center=locpt;
	Label_records[0].font=TitleFont;
	
	Label_records[1].text=@"Points";             	     locpt.x=img_panel.size.width/2-110;	locpt.y=60;  Label_records[1].center=locpt;
	Label_records[2].text=@"Mole";             	         locpt.x=img_panel.size.width/2+110;	locpt.y=60;  Label_records[2].center=locpt;
	Label_records[3].text=@"Bonus";             	     locpt.x=img_panel.size.width/2+110;	locpt.y=155;  Label_records[3].center=locpt;
	Label_records[1].font=subtitleFont;
	Label_records[2].font=subtitleFont;
	Label_records[3].font=subtitleFont;
    for(int i=4; i<14   ;i++)  {
		Label_records[i].text=@"---";             	 locpt.x=160;    locpt.y=90+(i-4)*17;  Label_records[i].center=locpt;
		Label_records[i].textAlignment = UITextAlignmentLeft;		} 
	
	for(int i=14; i<20   ;i++)  {Label_records[i].textAlignment = UITextAlignmentLeft;	}	
	
	Label_records[14].text=@"---";             	 locpt.x=370;    locpt.y=80;   Label_records[14].center=locpt;
	Label_records[15].text=@"---";             	 locpt.x=370;    locpt.y=100;  Label_records[15].center=locpt;
	Label_records[16].text=@"---";             	 locpt.x=370;    locpt.y=120;  Label_records[16].center=locpt;
	Label_records[17].text=@"---";             	 locpt.x=370;    locpt.y=180;  Label_records[17].center=locpt;
	Label_records[18].text=@"---";             	 locpt.x=370;    locpt.y=200;  Label_records[18].center=locpt;
	Label_records[19].text=@"---";             	 locpt.x=370;    locpt.y=220;  Label_records[19].center=locpt;
	
	for(int i=0; i<16   ;i++)  {
		Label_recordpoints[i] = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 100, 60.0)];
		Label_recordpoints[i].textColor = [UIColor blackColor];
		Label_recordpoints[i].backgroundColor = [UIColor clearColor];
		Label_recordpoints[i].textAlignment = UITextAlignmentRight;			
		[View_panel addSubview: Label_recordpoints[i]];	
	}
	for(int i=0; i<10   ;i++)  {
		Label_recordpoints[i].text=@"0";             locpt.x=130;    locpt.y=90+i*17;        Label_recordpoints[i].center=locpt;	}
	for(int i=10; i<13   ;i++)  {
		Label_recordpoints[i].text=@"0";             locpt.x=350;    locpt.y=80+(i-10)*20;   Label_recordpoints[i].center=locpt;	}
	for(int i=13; i<16   ;i++)  {
		Label_recordpoints[i].text=@"0";             locpt.x=350;    locpt.y=180+(i-13)*20;  Label_recordpoints[i].center=locpt;	}
	
	for(int i=0; i<20   ;i++)  { Label_records[i].hidden=YES;	    } 
	for(int i=0; i<16   ;i++)  { Label_recordpoints[i].hidden=YES;	} 
	
	
	// setup
	for(int i=0; i<5   ;i++)  {
		Label_setup[i] = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200.0, 60.0)];
		Label_setup[i].textColor = [UIColor blackColor];
		Label_setup[i].backgroundColor = [UIColor clearColor];
		Label_setup[i].textAlignment = UITextAlignmentLeft;	
		[View_panel addSubview: Label_setup[i]];	
		Label_setup[i].hidden=YES;
	}
	Label_setup[0].text=@"Set Up";             	     locpt.x=img_panel.size.width/2;	    locpt.y=35;  Label_setup[0].center=locpt;
	Label_setup[0].font=TitleFont;
	Label_setup[0].textAlignment = UITextAlignmentCenter;	
	
	Label_setup[1].text=@"Sound";             	     locpt.x=180;	    locpt.y=90;  
	//	Label_setup[1].font=subtitleFont;    
	Label_setup[1].center=locpt;
	Label_setup[2].text=@"Left-Right";             	 locpt.x=180;	    locpt.y=150;  
	//	Label_setup[2].font=subtitleFont;    
	Label_setup[2].center=locpt;
	Label_setup[3].text=@"Reset Records";            locpt.x=180;	    locpt.y=210;  
	//	Label_setup[3].font=subtitleFont;   
	Label_setup[3].center=locpt;
	
	
	
	CGRect frame = CGRectMake(40.0, 12.0, 160.0, 60);
	SlideVolume = [[UISlider alloc] initWithFrame:frame];
	SlideVolume.backgroundColor = [UIColor clearColor];
	SlideVolume.minimumValue = 0.0;
	SlideVolume.maximumValue = 100.0;
	SlideVolume.continuous = YES;
	SlideVolume.value = 50.0;	
	[SlideVolume setAccessibilityLabel:NSLocalizedString(@"StandardSlider", @"")];
	[SlideVolume addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
	[self.view addSubview: SlideVolume];	
	locpt.x=300;	    locpt.y=105;  
	SlideVolume.center=locpt;
	SlideVolume.hidden=YES;
	
	frame.origin.x=198.0;   frame.origin.y=12.0;
	frame.size.width=94.0;	frame.size.height=27.0;
	SwitchLR = [[UISwitch alloc] initWithFrame:frame];
	SwitchLR.backgroundColor = [UIColor clearColor];
	[SwitchLR setAccessibilityLabel:NSLocalizedString(@"StandardSwitch", @"")];
	[self.view addSubview: SwitchLR];	
	locpt.x=330;	    locpt.y=166;  
	SwitchLR.center=locpt;
	[SwitchLR addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    SwitchLR.hidden=YES;
	SwitchLR.on=YES;
	//	if (b_mancino) {SwitchLR.state =   }
	
	
	frame.origin.x=198.0;   frame.origin.y=12.0;
	frame.size.width=160.0;	frame.size.height=27.0;
	ResetButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	ResetButton.frame = frame;
	[ResetButton setTitle:@"Reset Records Data" forState:UIControlStateNormal];
	ResetButton.backgroundColor = [UIColor clearColor];
	[ResetButton addTarget:self action:@selector(buttonaction:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview: ResetButton];	
	locpt.x=330;	    locpt.y=225;  
	ResetButton.center=locpt;
	ResetButton.hidden=YES;
	
	
	
	ResetButtonNomi = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	ResetButtonNomi.frame = frame;
	[ResetButtonNomi setTitle:@"Reset Player's Name" forState:UIControlStateNormal];
	ResetButtonNomi.backgroundColor = [UIColor clearColor];
	[ResetButtonNomi addTarget:self action:@selector(buttonaction2:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview: ResetButtonNomi];	
	locpt.x=150;	    locpt.y=225;  
	ResetButtonNomi.center=locpt;
	ResetButtonNomi.hidden=YES;
	
	
	frame.origin.x=198.0;   frame.origin.y=12.0;
	frame.size.width=90.0;	frame.size.height=27.0;
	
	OKeraseButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	OKeraseButton.frame = frame;
	[OKeraseButton setTitle:@"OK" forState:UIControlStateNormal];
	OKeraseButton.backgroundColor = [UIColor clearColor];
	[self.view addSubview: OKeraseButton];	
	locpt.x=170;	    locpt.y=200;  
	OKeraseButton.center=locpt;
	OKeraseButton.hidden=YES;
	[OKeraseButton addTarget:self action:@selector(okerase:) forControlEvents:UIControlEventTouchUpInside];
	
	CanceleraseButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	CanceleraseButton.frame = frame;
	[CanceleraseButton setTitle:@"Cancel" forState:UIControlStateNormal];
	CanceleraseButton.backgroundColor = [UIColor clearColor];
	[self.view addSubview: CanceleraseButton];	
	locpt.x=310;	    locpt.y=200;  
	CanceleraseButton.center=locpt;
	CanceleraseButton.hidden=YES;
	[CanceleraseButton addTarget:self action:@selector(cancelerase:) forControlEvents:UIControlEventTouchUpInside];
	
	
	// Tutorial  - Rules
	img_freccia = [UIImage imageNamed:@"freccia.png"];
	
	for(int i=0; i<9   ;i++)  {
		lab_Tut[i] = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 100.0, 60.0)];
		lab_Tut[i].textColor = [UIColor blackColor];
		lab_Tut[i].backgroundColor = [UIColor clearColor];
		lab_Tut[i].textAlignment = UITextAlignmentCenter;	
		lab_Tut[i].font=TutorialFont;
		[View_panel addSubview: lab_Tut[i]];	
		//	lab_Tut[i].hidden=YES;
	}
	
	lab_Tut[0].text=@"Rules";             	     locpt.x=img_panel.size.width/2;	    locpt.y=40;  lab_Tut[0].center=locpt;
	lab_Tut[0].font=TitleFont; 	                 lab_Tut[0].textAlignment = UITextAlignmentCenter;	
	
	int ofc=100;
	
	// 1^ riga	
	View_Tut[0] = [[UIImageView alloc] initWithImage: img_sveglia];  // la sveglia
	[View_panel addSubview: View_Tut[0]];	
	View_Tut[0].transform=  CGAffineTransformMakeScale(0.36, 0.36);
	locpt.x=110;	    locpt.y=80;      View_Tut[0].center=locpt;
	
	View_Tut[1] = [[UIImageView alloc] initWithImage: img_freccia];  // la bombetta
	[View_panel addSubview: View_Tut[1]];	
	locpt.x=img_panel.size.width/2-30;	    locpt.y=80;      View_Tut[1].center=locpt;
	
	lab_Tut[1].text=@"+6°";             	     locpt.x=160+ofc;	    locpt.y=80;  lab_Tut[1].center=locpt;
	lab_Tut[1].font=TutorialFont; 	                 lab_Tut[1].textAlignment = UITextAlignmentCenter;	
	
	View_Tut[2] = [[UIImageView alloc] initWithImage: img_sveglia];  // la bombetta
	[View_panel addSubview: View_Tut[2]];	
	View_Tut[2].transform=  CGAffineTransformMakeScale(0.3, 0.3);
	locpt.x=190+ofc;	    locpt.y=80;      View_Tut[2].center=locpt;
	
	// 2^ riga	
	View_Tut[3] = [[UIImageView alloc] initWithImage: img_bonus[4]];  // la sveglia
	[View_panel addSubview: View_Tut[3]];	
	View_Tut[3].transform=  CGAffineTransformMakeScale(0.4, 0.4);
	locpt.x=110;	    locpt.y=120;      View_Tut[3].center=locpt;
	
	View_Tut[4] = [[UIImageView alloc] initWithImage: img_freccia];  // la bombetta
	[View_panel addSubview: View_Tut[4]];	
	locpt.x=img_panel.size.width/2-30;	    locpt.y=120;      View_Tut[4].center=locpt;
	
	lab_Tut[2].text=@"-5";             	     locpt.x=190+ofc;	    locpt.y=120;  lab_Tut[2].center=locpt;
	lab_Tut[2].font=TutorialFont; 	             lab_Tut[2].textAlignment = UITextAlignmentCenter;	
	
	View_Tut[5] = [[UIImageView alloc] initWithImage: img_esposione];  // la bombetta
	[View_panel addSubview: View_Tut[5]];	
	View_Tut[5].transform=  CGAffineTransformMakeScale(0.25, 0.25);
	locpt.x=160+ofc;	    locpt.y=120;      View_Tut[5].center=locpt;
	
	View_Tut[6] = [[UIImageView alloc] initWithImage: img_coin];  // la bombetta
	[View_panel addSubview: View_Tut[6]];	
	View_Tut[6].transform=  CGAffineTransformMakeScale(0.6, 0.6);
	locpt.x=210+ofc;	    locpt.y=120;      View_Tut[6].center=locpt;
	
	// 3^ riga	
	View_Tut[7] = [[UIImageView alloc] initWithImage: img_talpa[5]];  // la sveglia
	[View_panel addSubview: View_Tut[7]];	
	View_Tut[7].transform=  CGAffineTransformMakeScale(0.5, 0.5);
	locpt.x=110;	    locpt.y=165;      View_Tut[7].center=locpt;
	
	View_Tut[8] = [[UIImageView alloc] initWithImage: img_freccia];  // la bombetta
	[View_panel addSubview: View_Tut[8]];	
	locpt.x=img_panel.size.width/2-30;	    locpt.y=165;      View_Tut[8].center=locpt;
	
	lab_Tut[3].text=@"+1";             	     locpt.x=160+ofc;	    locpt.y=165;  lab_Tut[3].center=locpt;
	lab_Tut[3].font=TutorialFont; 	         lab_Tut[3].textAlignment = UITextAlignmentCenter;	
	
	View_Tut[9] = [[UIImageView alloc] initWithImage: img_talpanel];  // 
	[View_panel addSubview: View_Tut[9]];	
	locpt.x=190+ofc;	    locpt.y=165;      View_Tut[9].center=locpt;
	View_Tut[9].transform=  CGAffineTransformMakeScale(0.8, 0.8);
	
	lab_Tut[4].text=@"+?";             	     locpt.x=220+ofc;	    locpt.y=165;  lab_Tut[4].center=locpt;
	lab_Tut[4].font=TutorialFont; 	         lab_Tut[4].textAlignment = UITextAlignmentCenter;	
	
	View_Tut[10] = [[UIImageView alloc] initWithImage: img_coin];  // la bombetta
	[View_panel addSubview: View_Tut[10]];	
	View_Tut[10].transform=  CGAffineTransformMakeScale(0.6, 0.6);
	locpt.x=240+ofc;	    locpt.y=165;      View_Tut[10].center=locpt;
	
	
	// 4^ riga	
	View_Tut[11] = [[UIImageView alloc] initWithImage: img_talpah[5]];  // 
	[View_panel addSubview: View_Tut[11]];	
	View_Tut[11].transform=  CGAffineTransformMakeScale(0.5, 0.5);
	locpt.x=110;	    locpt.y=210;      View_Tut[11].center=locpt;
	
	View_Tut[12] = [[UIImageView alloc] initWithImage: img_freccia];  // la bombetta
	[View_panel addSubview: View_Tut[12]];	
	locpt.x=img_panel.size.width/2-30;	    locpt.y=210;      View_Tut[12].center=locpt;
	
	lab_Tut[5].text=@"-3";             	     locpt.x=160+ofc;	    locpt.y=210;  lab_Tut[5].center=locpt;
	lab_Tut[5].font=TutorialFont; 	         lab_Tut[5].textAlignment = UITextAlignmentCenter;	
	
	View_Tut[13] = [[UIImageView alloc] initWithImage: img_talpanel];  // 
	[View_panel addSubview: View_Tut[13]];	
	locpt.x=190+ofc;	    locpt.y=210;      View_Tut[13].center=locpt;
	View_Tut[13].transform=  CGAffineTransformMakeScale(0.8, 0.8);
	
	lab_Tut[6].text=@"-12";             	     locpt.x=225+ofc;	    locpt.y=210;  lab_Tut[6].center=locpt;
	lab_Tut[6].font=TutorialFont; 	         lab_Tut[6].textAlignment = UITextAlignmentCenter;	
	
	View_Tut[14] = [[UIImageView alloc] initWithImage: img_coin];  // la bombetta
	[View_panel addSubview: View_Tut[14]];	
	View_Tut[14].transform=  CGAffineTransformMakeScale(0.6, 0.6);
	locpt.x=250+ofc;	    locpt.y=210;      View_Tut[14].center=locpt;	
	
	// 5^ riga	
	View_Tut[15] = [[UIImageView alloc] initWithImage: img_bonus[0]];  // 
	[View_panel addSubview: View_Tut[15]];	
	View_Tut[15].transform=  CGAffineTransformMakeScale(0.4, 0.4);
	locpt.x=80;	    locpt.y=250;      View_Tut[15].center=locpt;
	
	View_Tut[16] = [[UIImageView alloc] initWithImage: img_bonus[1]];  // 
	[View_panel addSubview: View_Tut[16]];	
	View_Tut[16].transform=  CGAffineTransformMakeScale(0.4, 0.4);
	locpt.x=110;	    locpt.y=250;      View_Tut[16].center=locpt;
	
	View_Tut[17] = [[UIImageView alloc] initWithImage: img_bonus[2]];  // 
	[View_panel addSubview: View_Tut[17]];	
	View_Tut[17].transform=  CGAffineTransformMakeScale(0.4, 0.4);
	locpt.x=140;	    locpt.y=250;      View_Tut[17].center=locpt;
	
	View_Tut[18] = [[UIImageView alloc] initWithImage: img_freccia];  // 
	[View_panel addSubview: View_Tut[18]];	
	locpt.x=img_panel.size.width/2-30;	    locpt.y=250;      View_Tut[18].center=locpt;
	
	lab_Tut[7].text=@"+5°";             	     locpt.x=160+ofc;	    locpt.y=250;  lab_Tut[7].center=locpt;
	lab_Tut[7].font=TutorialFont; 	         lab_Tut[7].textAlignment = UITextAlignmentCenter;	
	
	View_Tut[19] = [[UIImageView alloc] initWithImage: img_sveglia];  // la bombetta
	[View_panel addSubview: View_Tut[19]];	
	View_Tut[19].transform=  CGAffineTransformMakeScale(0.3, 0.3);
	locpt.x=190+ofc;	    locpt.y=250;      View_Tut[19].center=locpt;
	
	lab_Tut[8].text=@"+5";             	     locpt.x=220+ofc;	    locpt.y=250;  lab_Tut[8].center=locpt;
	lab_Tut[8].font=TutorialFont; 	         lab_Tut[8].textAlignment = UITextAlignmentCenter;	
	
	View_Tut[20] = [[UIImageView alloc] initWithImage: img_coin];  // la bombetta
	[View_panel addSubview: View_Tut[20]];	
	View_Tut[20].transform=  CGAffineTransformMakeScale(0.6, 0.6);
	locpt.x=245+ofc;	    locpt.y=250;      View_Tut[20].center=locpt;
	
	for(int i=0; i<21   ;i++)  {View_Tut[i].hidden=YES;	}
	for(int i=0; i< 9   ;i++)  {lab_Tut[i].hidden=YES;	}
	
	
	
	frame.origin.x=198.0;   frame.origin.y=12.0;
	frame.size.width=160.0;	frame.size.height=40.0;
	OtherGamesButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	OtherGamesButton.frame = frame;
	[OtherGamesButton setTitle:@"Other Games" forState:UIControlStateNormal];
	OtherGamesButton.backgroundColor = [UIColor clearColor];
	[OtherGamesButton addTarget:self action:@selector(buttonactionothergame:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview: OtherGamesButton];	
	locpt.x=240;	    locpt.y=125;  
	OtherGamesButton.center=locpt;
	OtherGamesButton.hidden=YES;
	
	
	frame.origin.x=0.0;   frame.origin.y=0.0;
	frame.size.width=100.0;	frame.size.height=40.0;
	BuyGamesButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	BuyGamesButton.frame = frame;
	[BuyGamesButton setTitle:@"Buy iMole" forState:UIControlStateNormal];
	BuyGamesButton.backgroundColor = [UIColor clearColor];
	[BuyGamesButton addTarget:self action:@selector(buttonbuygame:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview: BuyGamesButton];	
	locpt.x=70;	    locpt.y=280;  
	BuyGamesButton.center=locpt;
//	BuyGamesButton.hidden=YES;
	
	
	
}


- (void)okerase                          :(id)sender {
	if (b_erasedata) {	for (int i=0; i<16; i++) { i_pointrecords[i]=0;  Str_nomirecords[i]=@"";  }  }
	else  {	for (int i=0; i< 3; i++) { i_UltimoRecord[i]=0;  String_nomeplayer[i]=@"";  textFieldNomi[i].text=nil;  } } 	
	i_indicenomeplayer=0;
	[self fissavariabili];
	[self p_EraseClose ];
}   

- (void)cancelerase                      :(id)sender {
	[self p_EraseClose ];
}         

- (void)buttonaction                     :(id)sender {
	b_erasedata=YES;
	Laberase1.text=@"You Erase";
	Laberase2.text=@"All Record";
	[self p_EraseOpen ];
}                                // AZIONI SETUP

- (void)buttonaction2                    :(id)sender {
	b_erasedata=NO;
	Laberase1.text=@"You reset Names in";
	Laberase2.text=@"Players Menu";
	[self p_EraseOpen ];
}                                // AZIONI SETUP

- (void)buttonactionothergame            :(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.com/apps/carlomacor"]];
}                                // AZIONI SETUP

- (void)buttonbuygame            :(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=351829300&mt=8"]];
}                                // AZIONI SETUP


- (void)sliderAction                     :(id)sender { 
	//
}

- (void)switchAction                     :(id)sender {
	[self switchmancino];	
}


- (void) scrivinumerotalpe          : (int) numero   {
	CGPoint locpt;
	int posdig;						
	div_t locvalue;
	for(int i=0; i<5;i++) {  View_digitnumtalpe[i].image=nil;}
	if (numero<1000) {View_digitnumtalpe[5].hidden=YES;} else {View_digitnumtalpe[5].hidden=NO;}
	posdig=1;
	if (numero==0) { View_digitnumtalpe[1].image=img_digits[0];   };
	locpt=View_digitnumtalpe[0].center;
    locpt.x=img_panlat.size.width/2-22;
	while (numero>0) {
		locvalue = div(numero ,10);
		numero=locvalue.quot;
		View_digitnumtalpe[posdig].image=img_digits[locvalue.rem]; 
		posdig=posdig+1;
		locpt.x=locpt.x+5;
	}	
	if (posdig==4) locpt.x=locpt.x+2;
	if (posdig>=5) locpt.x=locpt.x+12;
	View_digitnumtalpe[0].center=locpt;
}

- (void) scrivinumerobonus          : (int) numero   {
	CGPoint locpt;
	int posdig;						
	div_t locvalue;
	for(int i=0; i<5;i++) {  View_digitbonus[i].image=nil;}
	if (numero<1000) {View_digitbonus[5].hidden=YES;} else {View_digitbonus[5].hidden=NO;}
	posdig=1;
	if (numero==0) { View_digitbonus[1].image=img_digits[0];   };
	locpt=View_digitbonus[0].center;
    locpt.x=img_panlat.size.width/2-22;
	while (numero>0) {
		locvalue = div(numero ,10);
		numero=locvalue.quot;
		View_digitbonus[posdig].image=img_digits[locvalue.rem]; 
		posdig=posdig+1;
		locpt.x=locpt.x+5;
	}	
	if (posdig==4) locpt.x=locpt.x+2;
	if (posdig>=5) locpt.x=locpt.x+12;
	View_digitbonus[0].center=locpt;
}

- (void) scrivitime                 : (int) numero   {
	// View_digittime[5]
	int minuti;
	int secondi;
	div_t locvalue;
	locvalue = div(numero ,60);
	minuti=locvalue.quot;
	secondi=locvalue.rem;
	if (minuti>9) {minuti=9;}
	int posdig;			
	for(int i=0; i<4;i++) {  View_digittime[i].image=nil;}
	View_digittime[3].image=img_digits[minuti];
	posdig=1;
	if (secondi==0) {View_digittime[1].image=img_digits[0];   
		if (minuti>0) { View_digittime[2].image=img_digits[0];    }	};
	locvalue = div(secondi ,10);
	View_digittime[1].image=img_digits[locvalue.rem]; 
	View_digittime[2].image=img_digits[locvalue.quot]; 
}

- (void) scrivinumeropoints         : (int) numero   {
	int posdig;						// View_digitpunti[8]
	div_t locvalue;
	for(int i=0; i<7;i++) {  View_digitpunti[i].image=nil;}
	if (numero<1000) {View_digitpunti[7].hidden=YES;} else {View_digitpunti[7].hidden=NO;}
	posdig=1;
	if (numero==0) { View_digitpunti[1].image=img_digits[0];   };
	while (numero>0) {
		locvalue = div(numero ,10);
		numero=locvalue.quot;
		View_digitpunti[posdig].image=img_digits[locvalue.rem]; 
		posdig=posdig+1;
	}	
}


- (void) scrivinumeri                                {
	[ self scrivinumerotalpe  : i_numtalpeprese      ];
	[ self scrivinumerobonus  : i_numbonus           ];
	[ self scrivitime         : i_numsecondigame     ];
	[ self scrivinumeropoints : i_punti              ];
}

- (int)  casuale                    : (int) max      {
	div_t locvalue; 
	srandomdev();
	locvalue = div(random() ,max);
	return locvalue.rem;
}                 // Random

- (void) AttesaIniziale                              {
    static int counter = 0;
	counter++; if(counter>=1) {   [self p_StartMenuOpen]; counter=0; }
}

- (void) p_StartMenuOpen                             {
	CGPoint locpt;
	locpt.x=240;  locpt.y=-img_opzione.size.height;  
	for (int i=0; i<NUMLABELMENU; i++) { View_opzionemenu[i].center=locpt;		
		View_opzionemenu[i].hidden=NO; 
		View_opzionemenu[i].highlighted=NO;	}
    [self mettiLabelMenu:0];
	for (int i=0; i<3; i++) { textFieldNomi[i].hidden=YES; };
	
	
	self.gameState = kstate_MenuOpen;	
}

- (void) p_MenuOpen                                  {  //  kstate_MenuOpen
    CGPoint locpt;      	int  i_velopen=15;
	for (int i=NUMLABELMENU-1; i>=0; i--) { 
		locpt=View_opzionemenu[i].center;   
		if (locpt.y<(i*48+25)) {locpt.y=locpt.y+i_velopen; } else { if (i==(NUMLABELMENU-1)) self.gameState = kstate_MenuRun; }  ;
		if (locpt.y>(i*48+25)) { locpt.y=i*48+25;};
		View_opzionemenu[i].center=locpt;
	}
	BuyGamesButton.hidden=NO;

}

- (void) p_MenuRun                                   {  //  kstate_MenuRun
	// eventuale animazione lungo la fase di menu principale
	
}

- (void) p_MenuClose                                 {  //  kstate_menuClose
	CGPoint locpt;	CGPoint locpt2;
	int  i_velclose=20;
	locpt=View_opzionemenu[NUMLABELMENU-1].center;
	locpt.y=locpt.y-i_velclose;
	View_opzionemenu[NUMLABELMENU-1].center=locpt;
	if (locpt.y<-img_opzione.size.height){ [self p_EndMenuClose];  } ;
	for (int i=0; i<(NUMLABELMENU-1); i++) { 		
		locpt2=View_opzionemenu[i].center;
		if (locpt.y<locpt2.y) {  View_opzionemenu[i].center=locpt; }  ;
	}
}

- (void) p_EndMenuClose                              {  // <- p_MenuClose
	BuyGamesButton.hidden=YES;

	switch (self.sceltamenu) {
			/*
		case 0 :  
			[self NewGameSetUp];   
			[self Inverti_fissavariabili];     
			if (!b_gameover) { [self p_StartContinueOpen];  } else { [self p_StartNewGameOpen];  }
			break;  // continue
			 */
		case 0 :  
		case 1 :  [self p_StartNewGameOpen];           break;  // new game
		case 2 :  [self p_StartRecordsOpen];           break;  
		case 3 :  [self p_StarttutorialOpen];          break;  
		case 4 :  [self p_StartSetUpOpen];             break;  
		case 5 :  [self p_StartInfoOpen];              break;  
		default :	 break;
	}
}                                    //    qui il case delle opzioni Menu




- (int)  TestInsideMenu           : (CGPoint)Ptclick {
	int locres=-1;         	CGPoint locpt; 
	if ((Ptclick.x>(240-i_dimx2opzmenu) ) & (Ptclick.x<(240+i_dimx2opzmenu)  )) {
		for (int i=0; i<NUMLABELMENU; i++) { 
			locpt=View_opzionemenu[i].center;   
	        locpt.y=locpt.y+i_dimy2opzmenu;			
			if ((Ptclick.y>(locpt.y-40)) & (Ptclick.y<locpt.y)) {locres=i;  }      	
		}
	}
	for (int i=0; i<NUMLABELMENU; i++) { View_opzionemenu[i].highlighted=NO; }	 ;
	if (locres>=0) {View_opzionemenu[locres].highlighted=YES; }
    return locres;
}

- (void) clickupNewGame           : (CGPoint)Ptclick {
	int locres=-1;         	CGPoint locpt; 
	if ((Ptclick.x>(240-i_dimx2opzmenu) ) & (Ptclick.x<(240+i_dimx2opzmenu)  )) {
		for (int i=0; i<3; i++) { 
			locpt=View_opzionemenu[i].center;   
	        locpt.y=locpt.y+i_dimy2opzmenu;			
			if ((Ptclick.y>(locpt.y-40)) & (Ptclick.y<locpt.y)) {locres=i;  }      	
		}
	}	
	if (locres>=0)  {
		i_indicenomeplayer=locres; 
		[self NewGameSetUp ];   
		[self p_StartContinueOpen];}
}


- (void) clickupMenu              : (CGPoint)Ptclick {
	sceltamenu=[self TestInsideMenu : Ptclick];
	if (sceltamenu>=0) self.gameState = kstate_MenuClose;
}


- (void) mettirecords                                {
	int entrance=20;
	int valuerecord;
	// punteggio
	valuerecord=i_punti;
	for (int i=9; i>=0; i--) { if (valuerecord>i_pointrecords[i]) { entrance=i; i_UltimoRecord[0]=entrance;    }	}
	if (entrance<10){
		i_introducedrecord[0]=entrance;
		for (int i=9; i>entrance; i--) {  if (i>0) {i_pointrecords[i]=i_pointrecords[i-1]; Str_nomirecords[i]=Str_nomirecords[i-1]; } }
		i_pointrecords[entrance]	= valuerecord;
		Str_nomirecords[entrance]   = String_nomeplayer[i_indicenomeplayer];   ///  qui cambiare con il current player da salvare in file 
	}
	// num talpe
	entrance=20; 
	valuerecord=i_numtalpeprese;
	for (int i=12; i>=10; i--) { if (valuerecord>i_pointrecords[i]) { entrance=i; i_UltimoRecord[1]=entrance;    }	}
	if (entrance<13){
		i_introducedrecord[1]=entrance;
		for (int i=12; i>entrance; i--) {  if (i>10) {i_pointrecords[i]=i_pointrecords[i-1]; Str_nomirecords[i]=Str_nomirecords[i-1]; } }
		i_pointrecords[entrance]	= valuerecord;
		Str_nomirecords[entrance]   = String_nomeplayer[i_indicenomeplayer];   ///  qui cambiare con il current player da salvare in file 
	}
	
	// num bonus
	entrance=20; 
	valuerecord=i_numbonus;
	for (int i=15; i>=13; i--) { if (valuerecord>i_pointrecords[i]) { entrance=i; i_UltimoRecord[2]=entrance;    }	}
	if (entrance<16){
		i_introducedrecord[2]=entrance;
		for (int i=15; i>entrance; i--) {  if (i>13) {i_pointrecords[i]=i_pointrecords[i-1]; Str_nomirecords[i]=Str_nomirecords[i-1]; } }
		i_pointrecords[entrance]	= valuerecord;
		Str_nomirecords[entrance]   = String_nomeplayer[i_indicenomeplayer];   ///  qui cambiare con il current player da salvare in file 
	}	
	
	[self fissavariabili];
}   // metto records

- (void) aggiornatempo                               {
	static int countTime = 0;
	countTime++; 
	if (countTime>=30) {
		countTime=0; i_numsecondigame--;
		if ((i_numsecondigame>0) & (i_numsecondigame<6))  [self Suona:6];	
	};
    if (i_numsecondigame<=0) {  
		b_gameover=YES;  
		View_gameOver.hidden=NO;    [self mettirecords]; 	[self Suona:2];  
		i_30timegameoverNewrecord=90;
	};
}                // azioni buche-talpe

- (void) gameoverserecord                            {
	bool res=NO;
	for (int i=0; i<3; i++) {if (i_introducedrecord[i]<20) res=YES;	}
	if (res) {
		i_30timegameoverNewrecord--;
		if (i_30timegameoverNewrecord<=0) { b_fromgameopenrecord=YES; [self p_StartRecordsOpen];	};
	}
}



- (int)  dammifotogrammasequenza  : (int) indbuca    {
	int locresult;    // ampliare alle multisequenze
	locresult=-1;	
	switch (i_currentsequenza[indbuca]) {
		case 0 : if (i_currentfoto[indbuca]<17) { locresult=sequeszatalpa1[i_currentfoto[indbuca]];  }	else { i_currentfoto[indbuca]=0;}	break;
		case 1 : if (i_currentfoto[indbuca]<12) { locresult=sequeszatalpa2[i_currentfoto[indbuca]];  }	else { i_currentfoto[indbuca]=0;}	break;
		case 2 : if (i_currentfoto[indbuca]<12) { locresult=sequeszatalpa3[i_currentfoto[indbuca]];  }	else { i_currentfoto[indbuca]=0;}	break;
		case 3 : if (i_currentfoto[indbuca]<13) { locresult=sequeszatalpa4[i_currentfoto[indbuca]];  }	else { i_currentfoto[indbuca]=0;}	break;
    }
	return locresult;
}

- (void) reimpostabuca            : (int) indice     {
	bool res;
	b_bucaAttiva[indice]=NO;  
	// la prossima uscita talpa e' dopo almeno 3 secondi + tempo in relazione al numero delle buche presenti.
	i_30timenext[indice]=90+[self casuale:(30*i_gamelevel)]; 
	// settaggio anche della velocita' di azione talpa dal 4 al 9
	i_maxtimetrafoto[indice]=2+[self casuale:5];
	// quale sara' la sequenza da fare
	i_currentsequenza[indice]=[self casuale:4];
	b_bucaColpita[indice]    = NO;
	View_talpabuche[indice].center = pttalpainiziale[indice];
	View_talpabuche[indice].image=nil;
	View_talpabuche[indice].transform =  CGAffineTransformMakeRotation(0.0);
	
	res=[self casuale:3];   // una talpa su 4 non deve essere presa
	if (res==0)	{	b_talpone[indice] =  YES;} else  {	b_talpone[indice] =  NO;}
	if (b_presachiara) { b_talpone[indice] =  NO;}
	
}

- (void) attivabuca               : (int) indice     {
	if (View_buche[indice].hidden)	{
		i_gamelevel++;  
		View_buche[indice].hidden=NO;  
		i_30timenext[indice]=30+[self casuale:60];
		View_talpabuche[indice].image=nil;
	}
}	

- (void) attivaprossimabuca                          {
	int indnextbuca;   bool cercobuca;  int girifatti;
	cercobuca=YES; girifatti=0;
    indnextbuca=[self casuale:NUMMAXBUCHE];
	for (int i=0; i<NUMMAXBUCHE; i++) {  
		if (indnextbuca>=NUMMAXBUCHE) indnextbuca=0;
		if (View_buche[indnextbuca].hidden ) { [self attivabuca:indnextbuca]; break;     }
		else { indnextbuca++;} 
	}
	if (i_gamelevel>=NUMMAXBUCHE) { b_tuttelebuchevisibili=YES; b_attivasveglia=NO; View_sveglia.hidden=YES;};
	
	switch (i_gamelevel) {
		case    1 :  i_30nextbucaappear=10*3;    break; 
		case    2 :  i_30nextbucaappear=10*5;    break; 
		case    3 :  i_30nextbucaappear=10*6;    break; 
		case    4 :  i_30nextbucaappear=10*8;    break; 
		case    5 :  i_30nextbucaappear=10*10;    break; 
		default   :   i_30nextbucaappear=10*10+[self casuale:50]; break;
	}	
}

- (void) attivasveglia                               {	
	int indnextbuca;   bool cercobuca;  int girifatti;
	cercobuca=YES; girifatti=0;
    indnextbuca=[self casuale:NUMMAXBUCHE];
	for (int i=0; i<NUMMAXBUCHE; i++) {  
		if (indnextbuca>=NUMMAXBUCHE) indnextbuca=0;
		if (View_buche[indnextbuca].hidden ) { 
			ptsveglia=View_buche[indnextbuca].center;
			View_sveglia.center=ptsveglia; break; }
		else { indnextbuca++;} 
	}
	b_attivasveglia=YES;
	i_30timesveglia=30+[self casuale:60 ];
	View_sveglia.hidden=NO;
	i_30timenextsveglia = 60+[self casuale:120 ];
	// i_30timenextsveglia = 30;   // ----------------------------------------------------------------------------
	b_colpitasveglia    =  NO;
	
	// se coincide con talpa o bonus disattivarli
	CGPoint locptbonus; 
	for (int i=0; i<6; i++) {  	
		if (View_bonus[i].hidden) continue;
		if (b_colpitobonus[i]) continue;
		locptbonus=ptbonus[i];
		if ( (ptsveglia.x==locptbonus.x) & (ptsveglia.y==locptbonus.y) ) 
		{	b_attivobonus[i]=NO;	View_bonus[i].hidden=YES;	}
	}	
}

- (void) attivabonus      : (int) indice             {	
	CGPoint locptbuca;   CGPoint locptbonus; 
	int indnextbuca;   
    indnextbuca=[self casuale:NUMMAXBUCHE];
	b_attivobonus[indice]=YES;
	b_colpitobonus[indice]=NO;
	ptbonus[indice]=View_buche[indnextbuca].center;
	View_bonus[indice].hidden=NO;
    View_bonus[indice].center=ptbonus[indice];
    i_30timebonus[indice]    = 30+[self casuale:60 ];
	i_30timenextbonus[indice]= 60+[self casuale:120 ];
	// se pero' coincide con talpa attiva allora ridisattiviamo il tutto
	if (b_bucaAttiva[indnextbuca]) {	b_attivobonus[indice]=NO;	View_bonus[indice].hidden=YES;	}
	// non coincida con bonus gia' li presente
	locptbuca=View_bonus[indice].center;
	for (int i=0; i<6; i++) {  	
		if (i==indice) continue;
		if (b_colpitobonus[i]) continue;
		locptbonus=View_bonus[i].center;
		if ( (locptbuca.x==locptbonus.x) & (locptbuca.y==locptbonus.y) ) 
		{	b_attivobonus[indice]=NO;	View_bonus[indice].hidden=YES;}
	}	
	
	if ( (locptbuca.x==ptsveglia.x) & (locptbuca.y==ptsveglia.y) ) {	
		if (!b_colpitasveglia) { b_attivasveglia=NO; View_sveglia.hidden=YES;}
	}
}

- (void) disattivabonusecoincidente :  (int) indice  {
	CGPoint locptbuca;   CGPoint locptbonus; 
	locptbuca=View_buche[indice].center;	
	for (int i=0; i<6; i++) {  	
		if (View_bonus[i].hidden) continue;
		if (b_colpitobonus[i]) continue;
		locptbonus=ptbonus[i];
		if ( (locptbuca.x==locptbonus.x) & (locptbuca.y==locptbonus.y) ) 
		{	b_attivobonus[i]=NO;	View_bonus[i].hidden=YES;	}
	}	
	
	if ( (locptbuca.x==ptsveglia.x) & (locptbuca.y==ptsveglia.y) ) {	
		if (!b_colpitasveglia) { b_attivasveglia=NO; View_sveglia.hidden=YES;}
	}
}

- (void) attiva3talpe                                {
	CGPoint locpt;
	float roter;
    locpt.y=150;
	if (b_mancino) locpt.x=40;	else locpt.x=240;
	if (b_mancino) { roter=3.14/2;} else {roter=4.71;};
	for (int i=0; i<3; i++) {  
		View_3talpe[i].hidden=NO;
        View_3talpe[i].center=locpt;
		locpt.x=locpt.x+70;
		View_3talpe[i].transform =  CGAffineTransformMakeRotation(roter);
	}
}

- (void) azionecolpiscitalpa      : (CGPoint)Ptclick {
	int deltax=40;	int deltay=40;
	for (int i=0; i<NUMMAXBUCHE; i++) {  
		if (View_buche[i].hidden ) continue; 
		if (b_bucaColpita[i]) continue;
		if (b_bucaAttiva[i]) {
			if ( ( (Ptclick.x>(View_buche[i].center.x-deltax)   ) &  (Ptclick.x<(View_buche[i].center.x+deltax)   ))
				& ( (Ptclick.y>(ptbuche[i].y-deltay)   ) &  (Ptclick.y<(ptbuche[i].y+deltay)   )) )	 {
				b_bucaColpita[i]  =  YES;
				if (b_talpone[i]) { 
					if (!b_presachiara) {
						[self Suona:5];
						View_talpabuche[i].image=nil; b_presachiara=YES; 
						i_numtalpeprese=i_numtalpeprese-3; if (i_numtalpeprese<0) i_numtalpeprese=0;
						i_punti=i_punti-12;                if (i_punti<0) i_punti=0;
						[self attiva3talpe];
					}
				} else 
				{ View_talpabuche[i].image=img_talpa[1]; 
					[self Suona:3];
				} // la talpa con braccia alte
			}
		} 	
	}
}   // colpisci talpa

- (void) azionecolpiscisveglia    : (CGPoint)Ptclick {
	int deltax=40;	int deltay=40;
	if (View_sveglia.hidden ) return; 	
	if (b_colpitasveglia ) return; 	
	if (b_attivasveglia) {
		if ( ( (Ptclick.x>(ptsveglia.x-deltax)   ) &  (Ptclick.x<(ptsveglia.x+deltax)   ))
			& ( (Ptclick.y>(ptsveglia.y-deltay)   ) &  (Ptclick.y<(ptsveglia.y+deltay)   )) )	 {
			b_colpitasveglia    =  YES;
			[self Suona:7];
		}
	} 	
}   // colpisci sveglia

- (void) azionecolpiscibonus      : (CGPoint)Ptclick {
	int deltax=40;	int deltay=40;
	for (int i=0; i<6; i++) {  
		if (View_bonus[i].hidden ) continue; 	
		if (b_colpitobonus[i])     continue;
		
		if (b_attivobonus[i]) {
			if ( ( (Ptclick.x>(ptbonus[i].x-deltax)   ) &  (Ptclick.x<(ptbonus[i].x+deltax)   ))
				& ( (Ptclick.y>(ptbonus[i].y-deltay)   ) &  (Ptclick.y<(ptbonus[i].y+deltay)   )) )	 {
				b_colpitobonus[i]     =  YES;
				if (i<3)[self Suona:1];
			}
		} 	
	}
	
}   // colpisci bonus



- (void) sposta3talpebuca         : (int) indice     {
	CGPoint ptend;
	CGPoint ptori;
	CGPoint locpt;
	bool resv;
	
	int offx; 
	ptori.y=150;
	if (b_mancino) ptori.x=40;	else ptori.x=440;
	ptend = View_buche[indice].center;
	
	
	
	if (b_mancino) {
		offx=10;	
		for (int i=0; i<3; i++) {
			locpt=View_3talpe[i].center;
			if (locpt.x>=480) View_3talpe[i].hidden=YES; }
		
	} else {		
		offx=-10; 
		for (int i=0; i<3; i++) { 
			locpt=View_3talpe[i].center;
			if (locpt.x<=0) View_3talpe[i].hidden=YES; }
	}
	
	
	
	for (int i=0; i<3; i++) {  
		locpt=View_3talpe[i].center;
		locpt.x=locpt.x+offx;
		View_3talpe[i].center=locpt;
    }
	
	resv =YES;
	for (int i=0; i<3; i++) {  
		if (!View_3talpe[i].hidden) {resv =NO;}
		if (resv) {b_presachiara=NO;}
	}
}

- (void) spostatalpacolpita       : (int) indice     {
	bool topass;
	CGPoint locpt1;
	CGPoint locpt2;
	float roter;
	int deltax;	int deltay;  int offy; int absx;
	if (b_talpone[indice])  {[self sposta3talpebuca:indice];	return; } // {} //
	
	
	locpt1 = ptbuche[indice];
	if (b_mancino) {
		deltax=locpt1.x-40; 
		deltay=150-locpt1.y;
		if (deltax<0)  { absx=-deltax; } else { absx = deltax; };
		if (absx<0.03) { offy=0;       } else { offy = (deltay*30)/deltax;};		
		roter=4.71;
	} else {		
		deltax=440-locpt1.x; 
		deltay=150-locpt1.y;
		if (deltax<0)  { absx=-deltax; } else { absx = deltax; };
		if (absx<0.03) { offy=0;       } else { offy = (deltay*30)/deltax;};
		roter=3.14/2;
	}
	
	
	locpt2 = View_talpabuche[indice].center;
	locpt2.x=locpt2.x+i_xgoingtopanel;   
	locpt2.y=locpt2.y+offy;
	View_talpabuche[indice].center=locpt2;
	View_talpabuche[indice].transform =  CGAffineTransformMakeRotation(roter);
	
	topass=NO;
	if ( (b_mancino) & ((locpt1.x+locpt2.x)<40  ) ) topass=YES;
	if ( (!b_mancino) & ((locpt1.x+locpt2.x)>440 ) )  topass=YES;
	if (topass) 
	{
		if (b_talpone[indice]) {
		} else 
		{ i_numtalpeprese++; 
			if (i_gamelevel<5) { i_punti=i_punti+3;} else 
				if (i_gamelevel<11) { i_punti=i_punti+5;} else 
					if (i_gamelevel<16) { i_punti=i_punti+7;} else  { i_punti=i_punti+8;} 
			[self reimpostabuca:indice];	
		}
	}
}   // sposto la talpa colpita

- (void) spostasvegliacolpita                        {
	bool topass;
	CGPoint locpt;
	int deltax;	int deltay;  int offy; int absx; int offx;
	locpt=ptsveglia;
	int illox=20;
	
	if (b_mancino) {
		offx=-illox;
		deltax=locpt.x-40; 
		deltay=60-locpt.y;
		if (deltax<0)  { absx=-deltax; } else { absx = deltax; };
		if (absx<0.03) { offy=0;       } else { offy = (deltay*illox)/deltax;};		
	} else {		
		offx=illox;
		deltax=440-locpt.x; 
		deltay=60-locpt.y;
		if (deltax<0)  { absx=-deltax; } else { absx = deltax; };
		if (absx<0.03) { offy=0;       } else { offy = (deltay*illox)/deltax;};
	}
	
	ptsveglia.x=ptsveglia.x+offx;
	ptsveglia.y=ptsveglia.y+offy;
	View_sveglia.center=ptsveglia;
	
	topass=NO;
	if ( (b_mancino) & (ptsveglia.x<40  ) ) topass=YES;
	if ( (!b_mancino) & (ptsveglia.x>440 ) )  topass=YES;
	if (topass) { 
		b_attivasveglia=NO;
		View_sveglia.hidden=YES;
		i_30timenextsveglia = 60+[self casuale:120 ];
		b_colpitasveglia    =  NO;
		i_numsecondigame=i_numsecondigame+i_bonustimesveglia;
		b_arrivatasveglia=YES;
		i_30arrivatasveglia=45;
	}
}   // sposto la talpa colpita

- (void) attivatrebonus           : (bool) modo      {
	for (int i=0; i<3; i++) { View_littlebonus[i].hidden=modo; }
}

- (void) testtripletta                               {
	if (b_intripletta) {   // 45;
		i_30tripletta--;
		if (i_30tripletta<=0) { [self attivatrebonus:YES]; b_intripletta=NO; 
			for (int i=0; i<3; i++) { View_littlebonus[i].hidden= !b_trisnonus[i];   }
		}
		if ((i_30tripletta>0)  &  (i_30tripletta<=10))  [self attivatrebonus:NO];
		if ((i_30tripletta>10) &  (i_30tripletta<=16))  [self attivatrebonus:YES];
		if ((i_30tripletta>16) &  (i_30tripletta<=26))  [self attivatrebonus:NO];
		if ((i_30tripletta>26) &  (i_30tripletta<=32))  [self attivatrebonus:YES];
		if ((i_30tripletta>32) &  (i_30tripletta<=42))  [self attivatrebonus:NO];
	}
}

- (void) spostabonuscolpito       : (int) indice     {
	bool topass;
	CGPoint locpt;
	int deltax;	int deltay;  int offy; int absx;
	int illox=25;
	locpt=ptbonus[indice];
	
	
	if (b_mancino) {
		illox=-25;
		deltax=locpt.x-40; 
		deltay=220-locpt.y;
		if (deltax<0)  { absx=-deltax; } else { absx = deltax; };
		if (absx<0.03) { offy=0;       } else { offy = -(deltay*illox)/deltax;};		
	} else {		
		illox=25;
		deltax=440-locpt.x; 
		deltay=220-locpt.y;
		if (deltax<0)  { absx=-deltax; } else { absx = deltax; };
		if (absx<0.03) { offy=0;       } else { offy = (deltay*illox)/deltax;};
	}
	
	ptbonus[indice].x=ptbonus[indice].x+illox;
	ptbonus[indice].y=ptbonus[indice].y+offy;
	View_bonus[indice].center=ptbonus[indice];
	
	topass=NO;
	if ( (b_mancino) & (ptbonus[indice].x<40  ) ) topass=YES;
	if ( (!b_mancino) & (ptbonus[indice].x>440 ) )  topass=YES;
	
	if (topass) { 	
		if (indice< 3) {i_numbonus++;} else {i_numbonus--;} 
		if (indice< 3) {i_punti++;  View_littlebonus[indice].hidden=NO; b_trisnonus[indice]=YES; }
		if (indice>=3) {for (int i=0; i<3; i++) { b_trisnonus[i]=NO; View_littlebonus[i].hidden=YES;   } 
			i_punti=i_punti-5;
			b_inexplosione=YES; i_30explosiontime=45;
			View_esplosione.hidden=NO;
			[self Suona:0];
			
		}
		
        if (i_punti<0) {i_punti=0; }
		if (i_numbonus<0) {i_numbonus=0; }
		
		if ( (b_trisnonus[0]) & (b_trisnonus[1]) & (b_trisnonus[2]) ) {
			for (int i=0; i<3; i++) { b_trisnonus[i]=NO;    }  
			i_punti=i_punti+5;
			i_numsecondigame=i_numsecondigame+i_bonustimefruits;
			b_intripletta=YES; 	i_30tripletta=45;
			[self Suona:8];
		}
		
		b_attivobonus [indice]=NO;
		b_colpitobonus[indice]=NO;
		View_bonus[indice].hidden=YES;
		i_30timenextbonus[indice]= 90+[self casuale:180 ];	
	}
}   // sposto la talpa colpita




- (void) p_inGame                                    {
	int fotogramma; 
	if ( b_gameover) { [self gameoverserecord]; return;}
	if ( b_inpausa ) return;
	[self aggiornatempo];
	[self scrivinumeri ];	
	
	for (int i=0; i<NUMMAXBUCHE; i++) {  
		if (View_buche[i].hidden) continue;
		
		if (b_bucaAttiva[i]) {  // se buca in azione movimento
			if (b_bucaColpita[i]) {
				[self spostatalpacolpita:i];
			} else
			{
				i_loctimetrafoto[i]++;             // il numero di giri da superare per passare al prossimo fotogramma.
				if (i_loctimetrafoto[i]>=i_maxtimetrafoto[i]) {  
					[self disattivabonusecoincidente:i];  // qui il controllo che non ci siano bonus sotto;
					
					i_loctimetrafoto[i]=0;
					View_talpabuche[i].image=nil;
					
					fotogramma = [self dammifotogrammasequenza: i];				// dammifotogramma da procedura esterna
					if (fotogramma>=0) 
					{   
						if (b_talpone[i]) {
							if (b_presachiara) {[self reimpostabuca:i]; } else 
								View_talpabuche[i].image=img_talpah[fotogramma]; 
						} else 
						{ View_talpabuche[i].image=img_talpa[fotogramma];};
						i_currentfoto[i]++;
					} else 
					{ [self reimpostabuca:i]; }    // se fotogramma<1 siamo fine sequenza e si riaggiorna la buca
				}
			} // la buca non e' colpita
		} 
		else 
		{    // se buca in Non in azione movimento e quindi si aspetta
			i_30timenext[i]--;
			if (i_30timenext[i]<=0) { 
				b_bucaAttiva[i]=YES;  
			}
        }
	}
	
	// piano piano appaiono tutte le buche
	if (b_tuttelebuchevisibili) {} else {
		i_30nextbucaappear--;
		if (i_30nextbucaappear<=0) {   [self attivaprossimabuca ]; }
		// apparizione sveglia
		if (b_colpitasveglia) { [self spostasvegliacolpita];    } else {
			if (b_attivasveglia) {   // se e' attiva contiamo quanto ancora deve essere vista
				i_30timesveglia--; if  (i_30timesveglia<=0) { b_attivasveglia=NO; View_sveglia.hidden=YES;  }
			} else  // se invece non e' attiva
			{  // la sveglia non e' attiva si aspetta e poi la si visualizza
				i_30timenextsveglia--;
				if (i_30timenextsveglia<=0) { [self attivasveglia]; }			
			}
		}  // la sveglia
		
		
	}
	
	// i bonus anche se tutte le buche presenti
	for (int i=0; i<6; i++) {    // attivazione bonus
		if (b_colpitobonus[i]) { [self spostabonuscolpito:i ];    } else {
			if (b_attivobonus[i]) {  // se e' attivo bonus contiamo quanto ancora deve essere visto
				i_30timebonus[i]--; if  (i_30timebonus[i]<=0) { b_attivobonus[i]=NO; b_colpitobonus[i]=NO; View_bonus[i].hidden=YES;  }
			} else {  // il bonus non e' attivo allora aspettimao per attivarlo
				i_30timenextbonus[i]--;
				if (i_30timenextbonus[i]<=0) { [self attivabonus:i]; }			
			}
		} // se colpito o meno				  	
    }
	
	if (b_inexplosione)    { i_30explosiontime--; if (i_30explosiontime<=0) {  b_inexplosione=NO;  View_esplosione.hidden=YES;  }  }
	if (b_arrivatasveglia) {i_30arrivatasveglia--; 
		if  (i_30arrivatasveglia<=0) b_arrivatasveglia=NO;
	    if ((i_30arrivatasveglia>0)  & (i_30arrivatasveglia<10)) View_sveglialat.hidden=YES;
		if ((i_30arrivatasveglia>10) & (i_30arrivatasveglia<18)) View_sveglialat.hidden=NO;
		if ((i_30arrivatasveglia>18) & (i_30arrivatasveglia<28)) View_sveglialat.hidden=YES;
		if ((i_30arrivatasveglia>28) & (i_30arrivatasveglia<36)) View_sveglialat.hidden=NO;
		if (i_30arrivatasveglia>36) View_sveglialat.hidden=YES;
		
	} else { View_sveglialat.hidden=NO; };
	[self testtripletta];
	
	// siamo in demo .... se 11 buche si stoppa
	int numbuchepresenti=0;
	for (int i=0; i<NUMMAXBUCHE; i++) { 
		if (!View_buche[i].hidden) numbuchepresenti++;
	}	
	
	if (numbuchepresenti>10) { [self p_StartMenuOpen];  self.gameState = kstate_BackMenu; }
}			                                      // IN GAME




- (void) p_StartNewGameOpen                          {
	CGPoint locpt;
	locpt.x=240;  locpt.y=-img_opzione.size.height;  
	for (int i=0; i<NUMLABELMENU; i++) { View_opzionemenu[i].center=locpt;		View_opzionemenu[i].hidden=NO;	
		View_opzionemenu[i].highlighted=NO; }
	[self mettiNomiMenu];
	for (int i=1; i<4; i++) { View_opzionemenu[NUMLABELMENU-i].hidden=YES;		};	
	
	for (int i=0; i<3; i++) { if ( [String_nomeplayer[i] length]==0)  {textFieldNomi[i].hidden=NO;} else {textFieldNomi[i].hidden=YES;} };
	
	self.gameState = kstate_newGameMenuOpen;
}				  // NewGame menu open

- (void) p_NewGameOpen                               {
	CGPoint locpt;      	int  i_velopen=10;
	for (int i=2; i>=0; i--) { 
		locpt=View_opzionemenu[i].center;   
		if (locpt.y<(i*48+25)) {locpt.y=locpt.y+i_velopen; } 
		else 
		{ if (i==2) self.gameState = kstate_NewGameMenuRun; }  ;
	    if (locpt.y>(i*48+25)) { locpt.y=i*48+25;};
		View_opzionemenu[i].center=locpt;
		locpt.y=locpt.y+24;
		textFieldNomi[i].center=locpt;
	}		
}

- (void) NewGameSetUp                                {
	
	[self posizionawievbuche];
	[self posizionapannellinosxdx];
	
	b_gameover        = NO;
	i_gamelevel       =  0;                 // di fatto il numero delle buche visibili.
	i_numtalpeprese   =  0;
	i_numbonus        =  0;
	i_numsecondigame  = 60;                 // si comincia con un minuto
	i_punti           =  0;
	i_30nextbucaappear=3*30; // la seconda dopo 3 secondi
	b_tuttelebuchevisibili= NO;
	b_presachiara         = NO;
	b_inexplosione        = NO;
	b_inpausa             = NO;   View_pauselat.highlighted=NO;
	View_backlat.highlighted=NO;
	
	View_esplosione.hidden=YES;
	b_intripletta=NO;
	
	// resettaggio sveglia
	View_sveglia.hidden=YES;	b_attivasveglia=NO; 	b_colpitasveglia=NO;
	i_30timenextsveglia =30*10;
   	b_arrivatasveglia=NO;
	i_30arrivatasveglia=0;
	
	
	// resettaggio bonus
	for (int i=0; i<6; i++) { 
		b_attivobonus [i]=NO;
		b_colpitobonus[i]=NO;
		i_30timebonus[i]=0;
		i_30timenextbonus[i]=90+[self casuale:150];
		View_bonus[i].hidden=YES; 
	}
	
	for (int i=0; i<3; i++) { b_trisnonus[i]=NO; };
	for (int i=0; i<3; i++) {View_littlebonus[i].hidden=YES;};
	
	for (int i=0; i<3; i++) {i_UltimoRecord[i]=20;};  // da usare in pannello record per gli ultimi record fatti
	
	for (int i=0; i<3; i++) {i_introducedrecord[i]=20;};
	
	View_gameOver.hidden=YES;
	
	
	for (int i=0; i<NUMMAXBUCHE; i++) { 
		View_buche[i].hidden = YES;	
		b_bucaAttiva[i]      =  NO;    
		b_bucaColpita[i]     =  NO;
		b_talpone[i]         =  NO;
		i_loctimetrafoto[i]  =   0;
		i_maxtimetrafoto[i]  =   7;
		i_currentfoto[i]     =   0;
		i_currentsequenza[i] =   0;
		i_30timenext[i]      =   0;
		pttalpainiziale[i]   =   View_talpabuche[i].center;
	}
	
	
	
	[self attivabuca:5];
	b_fromgameopenrecord=NO;
	
	
}				  // NEW GAME



- (void) p_StartContinueOpen                         {
	CGPoint locpt; 
	locpt.x=240; locpt.y=-160;
	Pagina2.center=locpt;
	b_inpausa             = NO;   View_pauselat.highlighted=NO;
	b_fromgameopenrecord=NO;
	self.gameState=kstate_ContinueOpen;
}				  // Continue

- (void) p_ContinueOpen                              {
	CGPoint locpt;    int step=12;
	locpt=Pagina2.center;   locpt.y=locpt.y+step;   Pagina2.center=locpt;
	locpt=Pagina1.center;	locpt.y=locpt.y+step;   Pagina1.center=locpt;
	
    if (locpt.y>=(320+160)) {	
		locpt.y=160;       Pagina2.center=locpt;
		locpt.y=320+160;   Pagina1.center=locpt;
		self.gameState=kstate_inGame;
		for (int i=0; i<3; i++) { textFieldNomi[i].hidden=YES;	}
	}
	for (int i=0; i<3; i++) { locpt=textFieldNomi[i].center;  locpt.y=locpt.y+step;  textFieldNomi[i].center=locpt;	}
	
}

- (void) p_BackMenu                                  {
	CGPoint locpt;    int step=12;
	locpt=Pagina2.center;   locpt.y=locpt.y-step;   Pagina2.center=locpt;
	locpt=Pagina1.center;	locpt.y=locpt.y-step;   Pagina1.center=locpt;
    if (locpt.y<=(160)) {	
		locpt.y=-160;       Pagina2.center=locpt;
		locpt.y=160;   Pagina1.center=locpt;
		self.gameState = kstate_MenuOpen;  }
}



- (void) p_StartRecordsOpen                          {
	NSString    *str_result;
	View_panel.hidden=NO;
	View_panel.alpha=0.9;
	f_scaleinfopanel=0.0;
	View_panel.transform =  CGAffineTransformMakeScale(f_scaleinfopanel, f_scaleinfopanel);
	for(int i=0; i<20   ;i++)  { Label_records[i].hidden=NO;  } 
	
	
	for(int i=0; i<16   ;i++)  { 
		Label_recordpoints[i].textColor = [UIColor blackColor];
		Label_records[i+4].textColor = [UIColor blackColor];
    }
	
	
	for(int i=0; i<3   ;i++)  { 
		if (i_introducedrecord[i]<20) {
			Label_recordpoints[i_introducedrecord[i]].textColor = [UIColor redColor];
			Label_records[i_introducedrecord[i]+4].textColor = [UIColor redColor];
		}
    }
	
	
	
	
	for(int i=0; i<16   ;i++)  {
		Label_recordpoints[i].hidden=NO;	
		Label_records[i+4].text=Str_nomirecords[i];
		str_result = [NSString stringWithFormat:@"%i", i_pointrecords[i]];
	    Label_recordpoints[i].text =  str_result;
		if (i_pointrecords[i]==0) { Label_records[i+4].text=@"----"; } else {	Label_records[i+4].text=Str_nomirecords[i];}
	} 
	self.gameState = kstate_inRecordsOpen; 
}                 // Records 

- (void) p_RecordsOpen                               {
	f_scaleinfopanel=f_scaleinfopanel+0.1;
	if  (f_scaleinfopanel>=1) { f_scaleinfopanel=1.0;  self.gameState = kstate_inRecords;  };
	View_panel.transform =  CGAffineTransformMakeScale(f_scaleinfopanel, f_scaleinfopanel);
}

- (void) p_RecordsClose                              {
	f_scaleinfopanel=f_scaleinfopanel-0.1;
	if  (f_scaleinfopanel<=0) { f_scaleinfopanel=0.0;  
		for(int i=0; i<20   ;i++)  { Label_records[i].hidden=YES;	    } 
		for(int i=0; i<16   ;i++)  { Label_recordpoints[i].hidden=YES;	} 
		if (b_fromgameopenrecord) {self.gameState=kstate_inGame;    
			for (int i=0; i<3; i++) {i_introducedrecord[i]=20;  b_fromgameopenrecord=NO;       }
		}
		else [self p_StartMenuOpen ];  
	};
	View_panel.transform =  CGAffineTransformMakeScale(f_scaleinfopanel, f_scaleinfopanel);
}



- (void) p_StartSetUpOpen                            {
	View_panel.hidden=NO;
	View_panel.alpha=0.9;
	f_scaleinfopanel=0.0;
	View_panel.transform =  CGAffineTransformMakeScale(f_scaleinfopanel, f_scaleinfopanel);
	for(int i=0; i<5   ;i++)  {	Label_setup[i].hidden=NO;	}
	SlideVolume.value = f_soundlevel;	
	if (b_mancino) { SwitchLR.on=YES; } else	{ SwitchLR.on=NO; };
	self.gameState = kstate_inSetUpOpen; 
}                 // SetUp 

- (void) p_SetUpOpen                                 {
	f_scaleinfopanel=f_scaleinfopanel+0.1;
	if  (f_scaleinfopanel>=1) { f_scaleinfopanel=1.0; 
		SlideVolume.hidden=NO;
		SwitchLR.hidden=NO;
		ResetButton.hidden=NO;
		ResetButtonNomi.hidden=NO;
		self.gameState = kstate_inSetUp;  };
	View_panel.transform =  CGAffineTransformMakeScale(f_scaleinfopanel, f_scaleinfopanel);
}

- (void) p_SetUpClose                                {
	CGPoint locpt; 
	f_scaleinfopanel=f_scaleinfopanel-0.1;
	if  (f_scaleinfopanel<=0) { 
		f_scaleinfopanel=0.0; 
		for(int i=0; i<5   ;i++)  {	Label_setup[i].hidden=YES;	}
	    SlideVolume.hidden=YES;
	    SwitchLR.hidden=YES;
	    ResetButton.hidden=YES;
	    ResetButtonNomi.hidden=YES;
		f_soundlevel=SlideVolume.value;
		b_mancino=SwitchLR.on;
		if (b_mancino) {locpt.x=240+40;} else {locpt.x=240-40;};  locpt.y=160;
		View_gameOver.center=locpt;
		[self settavolumi ];
		[self fissavariabili];
		
		[self p_StartMenuOpen ];  
	};
	View_panel.transform =  CGAffineTransformMakeScale(f_scaleinfopanel, f_scaleinfopanel);
}



- (void) p_StartInfoOpen                             {
	View_panel.hidden=NO;
	View_panel.alpha=0.9;
	f_scaleinfopanel=0.0;
	View_panel.transform =  CGAffineTransformMakeScale(f_scaleinfopanel, f_scaleinfopanel);
	
	for(int i=0; i<5   ;i++)  {	Label_info[i].hidden=NO;}
	
	self.gameState = kstate_inInfoOpen; 
}                 // info 

- (void) p_InfoOpen                                  {
	f_scaleinfopanel=f_scaleinfopanel+0.1;
	if  (f_scaleinfopanel>=1) {
		f_scaleinfopanel=1.0;  self.gameState = kstate_inInfo; 
		OtherGamesButton.hidden=NO;
		//		myWebView.hidden=NO;
		//		[myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.carlomacor.com/Imole.htm"]]];	
	};
	View_panel.transform =  CGAffineTransformMakeScale(f_scaleinfopanel, f_scaleinfopanel);
}

- (void) p_InfoClose                                 {
	OtherGamesButton.hidden=YES;

	f_scaleinfopanel=f_scaleinfopanel-0.1;
	if  (f_scaleinfopanel<=0) { f_scaleinfopanel=0.0; 
		for(int i=0; i<5   ;i++)  {	Label_info[i].hidden=YES;}
        [self p_StartMenuOpen ];  };
	View_panel.transform =  CGAffineTransformMakeScale(f_scaleinfopanel, f_scaleinfopanel);
}


- (void) p_EraseOpen                                 {
	View_panelerase.hidden=NO;
    self.gameState=kstate_inErase;
	SlideVolume.hidden=YES;
	SwitchLR.hidden=YES;
	ResetButton.hidden=YES;
	ResetButtonNomi.hidden=YES;
	OKeraseButton.hidden=NO;
	CanceleraseButton.hidden=NO;
	Laberase1.hidden=NO;
	Laberase2.hidden=NO;
}

- (void) p_EraseClose                                {
	View_panelerase.hidden=YES;
    self.gameState=kstate_inSetUp;
	SlideVolume.hidden=NO;
	SwitchLR.hidden=NO;
	ResetButton.hidden=NO;
	ResetButtonNomi.hidden=NO;
	OKeraseButton.hidden=YES;
	CanceleraseButton.hidden=YES;
	Laberase1.hidden=YES;
	Laberase2.hidden=YES;
}


- (void) p_StarttutorialOpen                         {
	View_panel.hidden=NO;
	View_panel.alpha=0.9;
	f_scaleinfopanel=0.0;
	View_panel.transform =  CGAffineTransformMakeScale(f_scaleinfopanel, f_scaleinfopanel);
	for(int i=0; i<9   ;i++)  { lab_Tut[i].hidden=NO; }
	for(int i=0; i<21   ;i++)  { View_Tut[i].hidden=NO; }
	self.gameState = kstate_inTutorialOpen;
}                 // info 

- (void) p_TutorialOpen                              {
	f_scaleinfopanel=f_scaleinfopanel+0.1;
	if  (f_scaleinfopanel>=1) { f_scaleinfopanel=1.0;  self.gameState = kstate_inTutorial;  };
	View_panel.transform =  CGAffineTransformMakeScale(f_scaleinfopanel, f_scaleinfopanel);
}

- (void) p_TutorialClose                             {
	f_scaleinfopanel=f_scaleinfopanel-0.1;
	if  (f_scaleinfopanel<=0) { f_scaleinfopanel=0.0; 
		for(int i=0; i<9   ;i++)  { lab_Tut[i].hidden=YES; }
		for(int i=0; i<21   ;i++)  { View_Tut[i].hidden=YES; }
        [self p_StartMenuOpen ];  };
	View_panel.transform =  CGAffineTransformMakeScale(f_scaleinfopanel, f_scaleinfopanel);
}



- (BOOL) TestInsidebackMenu       : (CGPoint)Ptclick {
	BOOL locres=NO;     
	if	 (((Ptclick.x>(pos_butbackmenu.x-i_dimbutbackmenu2))  & (Ptclick.x<(pos_butbackmenu.x+i_dimbutbackmenu2) )) 	 &
		  ((Ptclick.y>(pos_butbackmenu.y-i_dimbutbackmenu2))  & (Ptclick.y<(pos_butbackmenu.y+i_dimbutbackmenu2) )) ) {locres=YES;}
	return locres;
}


- (void) clickdownInfo            : (CGPoint)Ptclick {
	BOOL locres=NO; 
	locres=[self TestInsidebackMenu : Ptclick];
	if (locres) { View_backbut.highlighted=YES; } else  { View_backbut.highlighted=NO; };
}

- (void) clickupInfo              : (CGPoint)Ptclick {
	BOOL locres=NO; 
	locres=[self TestInsidebackMenu : Ptclick];
	View_backbut.highlighted=NO; 
	if (locres) { 
		switch (self.gameState) {
			case kstate_inInfo    : self.gameState = kstate_inInfoClose;  	break;  // myWebView.hidden=YES;	
			case kstate_inRecords : self.gameState = kstate_inRecordsClose; break;
			case kstate_inSetUp   : 
				SlideVolume.hidden=YES;
				SwitchLR.hidden=YES;
				ResetButton.hidden=YES;
				ResetButtonNomi.hidden=YES;
				self.gameState = kstate_inSetUpClose;   break;
			case kstate_inTutorial: self.gameState = kstate_inTutorialClose;    break;
				
				
		};
	};
}

- (void) clickupBackMenu          : (CGPoint)Ptclick {
	BOOL locres=NO; 
	locres=[self TestInsidebackMenu : Ptclick];
	View_backbut.highlighted=NO; 
	if (locres) { [self p_StartMenuOpen];  self.gameState = kstate_BackMenu;  };
}





- (BOOL) TestInsidebackgame       : (CGPoint)Ptclick {
	BOOL locres=NO;     
	int offset;
	if (b_mancino) offset=0; else offset=480-img_panlat.size.width;;
	if	 (((Ptclick.x>(offset+pos_butbackpanel.x-i_butbackpanel2))  & (Ptclick.x<(offset+pos_butbackpanel.x+i_butbackpanel2) )) 
		  &
		  ((Ptclick.y>(pos_butbackpanel.y-i_butbackpanel2))  & (Ptclick.y<(pos_butbackpanel.y+i_butbackpanel2) )) ) 
	{locres=YES;}
	return locres;
}

- (BOOL) TestInsidepausegame      : (CGPoint)Ptclick {
	BOOL locres=NO;     
	int offset;
	if (b_mancino) offset=0; else offset=480-img_panlat.size.width;;
	if	 (((Ptclick.x>(offset+pos_butpausepanel.x-i_butpausepanel2))  & (Ptclick.x<(offset+pos_butpausepanel.x+i_butpausepanel2) )) 	 &
		  ((Ptclick.y>(pos_butpausepanel.y-i_butpausepanel2))  & (Ptclick.y<(pos_butpausepanel.y+i_butpausepanel2) )) ) {locres=YES;}
	return locres;
}

- (void) clickdownGame            : (CGPoint)Ptclick {
	bool res=YES;
	if (b_gameover) {
		for (int i=0; i<3; i++) {if (i_introducedrecord[i]<20) res=NO;	}
		if (res) { [self p_StartMenuOpen];  self.gameState = kstate_BackMenu; } 
	}
	
	if ([self TestInsidepausegame:Ptclick]) {View_pauselat.highlighted=YES;	} else {
		if (b_inpausa) {View_pauselat.highlighted=YES;} else { View_pauselat.highlighted=NO;} };
	if ([self TestInsidebackgame:Ptclick])  {View_backlat.highlighted=YES;	} else {View_backlat.highlighted=NO;	}
	[self azionecolpiscitalpa     :Ptclick];
	[self azionecolpiscisveglia   :Ptclick];
	[self azionecolpiscibonus     :Ptclick];
}

- (void) clickmoveGame            : (CGPoint)Ptclick {
	if ([self TestInsidepausegame:Ptclick]) {View_pauselat.highlighted=YES;	} else { 
		if (b_inpausa) {View_pauselat.highlighted=YES;} else { View_pauselat.highlighted=NO;} };
	if ([self TestInsidebackgame:Ptclick])  {View_backlat.highlighted=YES;	} else {View_backlat.highlighted=NO;	}
	
}

- (void) clickupGame              : (CGPoint)Ptclick {
	if ([self TestInsidepausegame:Ptclick]) {
		if (b_inpausa) { View_pauselat.highlighted=NO;	  b_inpausa=NO; } else 
		{ View_pauselat.highlighted=YES;	  b_inpausa=YES; }
	} else {
		if (b_inpausa) {View_pauselat.highlighted=YES;} else { View_pauselat.highlighted=NO;} 
	}
	View_backlat.highlighted=NO;	
	if ([self TestInsidebackgame:Ptclick])  {   [self fissavariabili ];   [self p_StartMenuOpen];  self.gameState = kstate_BackMenu;  };  
	
}

/*
 - (void) caricabrowser {
 CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
 webFrame.origin.x =  30.0;	
 webFrame.origin.y =  30.0;	
 webFrame.size.width  = 260.0;
 webFrame.size.height = 374.0;
 myWebView = [[[UIWebView alloc] initWithFrame:webFrame] autorelease];
 myWebView.backgroundColor = [UIColor brownColor];
 myWebView.scalesPageToFit = YES;
 myWebView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
 myWebView.delegate = self;
 [self.view addSubview: myWebView];
 myWebView.hidden=YES;
 // [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com/"]]];
 //   [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
 }
 */

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void) viewDidLoad                                 {
    [super viewDidLoad     ];
	[self  setupvariabili  ];
	[self  setupsequenze   ];
	[self  loadDigits      ];
	[self  loadMenu        ];
	[self  loadgraficagame ];
	[self  loadpannelli    ];
	[self  loadlabelpannelli ];
	[self  Inverti_fissavariabili ];
	[self  initSound ];
	//	[self  caricabrowser];
	
	[NSTimer scheduledTimerWithTimeInterval:0.0333 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
	self.gameState=kstate_StartGame;
}




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
	
}


- (void)didReceiveMemoryWarning                      {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload                                {
	//
}



- (void)gameLoop                                     {
	switch (self.gameState) {
		case kstate_StartGame:        [self AttesaIniziale];    break;  // attiva -> kstate_menuRun
		case kstate_MenuOpen :        [self p_MenuOpen];        break;
		case kstate_MenuRun  :        [self p_MenuRun];         break;
		case kstate_MenuClose:        [self p_MenuClose];       break;
			
		case kstate_inRecordsOpen:    [self p_RecordsOpen];     break;
		case kstate_inRecordsClose:   [self p_RecordsClose];    break;
			
		case kstate_inSetUpOpen:      [self p_SetUpOpen];       break;
		case kstate_inSetUpClose:     [self p_SetUpClose];      break; 
			
		case kstate_inInfoOpen:       [self p_InfoOpen];        break;
		case kstate_inInfoClose:      [self p_InfoClose];       break;
			
		case kstate_inTutorialOpen:	  [self p_TutorialOpen];    break;
		case kstate_inTutorialClose:  [self p_TutorialClose];    break;
			
		case kstate_newGameMenuOpen:  [self p_NewGameOpen];     break;
		case kstate_ContinueOpen:     [self p_ContinueOpen];    break;
			
		case kstate_InitQuadroOpen :                            break;
		case kstate_inGame:           [self p_inGame];          break;	
		case kstate_BackMenu:         [self p_BackMenu];        break;	
		default :	 break;
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	CGPoint thumbPoint;
	UITouch *thumb = [[event allTouches] anyObject];
	thumbPoint = [thumb locationInView:thumb.view];	
	switch (self.gameState) {
		case kstate_MenuRun        : [self  TestInsideMenu :  thumbPoint ]; break;
		case kstate_NewGameMenuRun : [self  TestInsideMenu  :  thumbPoint ]; break;
		case kstate_inRecords      : [self  clickdownInfo  :  thumbPoint ]; break;
		case kstate_inTutorial     : [self  clickdownInfo  :  thumbPoint ]; break;
		case kstate_inSetUp        : [self  clickdownInfo  :  thumbPoint ]; break;
		case kstate_inInfo         : [self  clickdownInfo  :  thumbPoint ]; break;
			
		case kstate_inGame         : [self  clickdownGame  :  thumbPoint ]; break;
			
		default :	 break;
	}	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint thumbPoint;
	UITouch *thumb = [[event allTouches] anyObject];
	thumbPoint = [thumb locationInView:thumb.view];	
	switch (self.gameState) {
		case kstate_MenuRun        : [self  TestInsideMenu :  thumbPoint ]; break;
		case kstate_NewGameMenuRun : [self  TestInsideMenu :  thumbPoint ]; break;
		case kstate_inRecords      : [self  clickdownInfo  :  thumbPoint ]; break;
		case kstate_inTutorial     : [self  clickdownInfo  :  thumbPoint ]; break;
		case kstate_inSetUp        : [self  clickdownInfo  :  thumbPoint ]; break;
		case kstate_inInfo         : [self  clickdownInfo  :  thumbPoint ]; break;
			
		case kstate_inGame         : [self  clickmoveGame  :  thumbPoint ]; break;
			
		default :	 break;
	}	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint thumbPoint;
	UITouch *thumb = [[event allTouches] anyObject];
	thumbPoint = [thumb locationInView:thumb.view];
	switch (self.gameState) {
		case kstate_MenuRun        : [self  clickupMenu    :  thumbPoint ]; break;
		case kstate_NewGameMenuRun : [self  clickupNewGame :  thumbPoint ]; break;
		case kstate_inRecords      : [self  clickupInfo    :  thumbPoint ]; break;
		case kstate_inTutorial     : [self  clickupInfo    :  thumbPoint ]; break;
		case kstate_inSetUp        : [self  clickupInfo    :  thumbPoint ]; break;
		case kstate_inInfo         : [self  clickupInfo    :  thumbPoint ]; break;
			
		case kstate_inGame         : [self  clickupGame    :  thumbPoint ]; break;
			
		default :	 break;
	}
	
}



- (void)dealloc {
	//	[myWebView           release];
	[img_sfondomenu      release];
	[img_sfondogame      release];
	[img_opzione         release];
	[img_opzioneh        release];
	[img_panel           release];                     
	[View_panel          release]; 
	[img_gameOver        release];				    
	[View_gameOver       release];				
	[img_panlat          release];				    
	[View_panlat         release];
	[img_talpanel        release];			    	
	[View_talpanel       release];
	[img_pauselat        release];	
	[img_pausehlat       release];		 	        
	[View_pauselat       release];
	[img_backlat         release];				   
	[img_backhlat        release];                  
	[View_backlat        release];
	[View_sveglialat     release];
	[img_coin            release];					    
	[View_coin           release];
	
	for (int i=0; i<NUMLABELMENU; i++) { 
		[View_opzionemenu[i]   release];  
		[labM            [i]   release];
		
	}
	
	for (int i=0; i<NUMMAXBUCHE; i++) { 
		[View_buche      [i]   release];
		[View_talpabuche [i]   release];
		[Key_intcomp1    [i]   release];
		[Key_intcomp2    [i]   release];
	}
	
	
	for (int i=0; i< 9; i++)  { [lab_Tut [i]            release]; };
	for (int i=0; i<21; i++)  { [View_Tut[i]            release]; };
	for (int i=0; i<11; i++)  { [img_digits[i]          release]; };
	for (int i=0; i< 6; i++)  { [View_digitnumtalpe[i]  release]; };
	for (int i=0; i< 5; i++)  { [View_digittime[i]      release]; };
	for (int i=0; i< 6; i++)  { [View_digitbonus[i]     release]; };
	for (int i=0; i< 8; i++)  { [View_digitpunti[i]     release]; };
	for (int i=0; i< 7; i++)  { [img_talpa[i]           release]; };
	for (int i=0; i< 7; i++)  { [img_talpah[i]          release]; };
	for (int i=0; i< 3; i++)  { [View_3talpe[i]         release]; };
	for (int i=0; i< 6; i++)  { [img_bonus[i]           release]; };
	for (int i=0; i< 6; i++)  { [View_bonus[i]          release]; };
	for (int i=0; i< 3; i++)  { [View_littlebonus[i]    release]; };
	for (int i=0; i< 5; i++)  { [Label_info[i]          release]; };
	for (int i=0; i<20; i++)  { [Label_records[i]       release]; };
	for (int i=0; i<16; i++)  { [Label_recordpoints[i]  release]; };
	for (int i=0; i< 5; i++)  { [Label_setup[i]         release]; };
	
	[img_freccia         release];				   
	[View_panelerase     release];  
	[OKeraseButton       release];
	[CanceleraseButton   release];
	[Laberase1           release];
	[Laberase2           release];
	[View_backbut        release];
	[img_buca            release];
	[img_sveglia         release];					
	[View_sveglia        release];				
	[Pagina1             release];
	[Pagina2             release];
	[Pagina3             release];
	[Pagina4             release];
	[Pagina5             release];
	[img_esposione       release];    	
	[View_esplosione     release];
	[SlideVolume         release];
	[SwitchLR            release];
	[ResetButton         release];
	[ResetButtonNomi     release];
	[soundPlayerThread   release];
	[Key_intsetup        release];
	[Key_intlastpalyer   release];
	[Key_primaapertura   release];
	
	for (int i=0; i< NUMSOUNDS; i++)  { [effectPlayer[i]    release]; };
	for (int i=0; i< 3; i++)    { [textFieldNomi[i]         release]; };
	for (int i=0; i< 3; i++)    { [String_nomeplayer[i]     release]; };
	for (int i=0; i<16; i++)    { [Str_nomirecords[i]       release]; };
	for (int i=0; i< 3; i++)    { [Key_nomeplayer[i]        release]; };
	for (int i=0; i<16; i++)    { [Key_nomerecords[i]       release]; };
	for (int i=0; i<16; i++)    { [Key_intrecords[i]        release]; };
	for (int i=0; i< 5; i++)    { [Key_intvalgame[i]        release]; };
	for (int i=0; i< 5; i++)    { [Key_intvalgame[i]        release]; };
	for (int i=0; i< 3; i++)    { [Key_intrecordlast[i]     release]; };
	for (int i=0; i<22; i++)    { [Key_intdata[i]           release]; };
	for (int i=0; i<22; i++)    { [Key_booldata[i]          release]; };
	for (int i=0; i<14; i++)    { [Key_floatdata[i]         release]; };
	
	[super dealloc];
	
}

@end

