waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["allgemein","Allgemeines"];
player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["preise","Preise & Jobs"];
player createDiarySubject ["serverrules","Regeln"];
player createDiarySubject ["controls","Steuerung"];

	player createDiaryRecord["allgemein",
		[
			"Avanix Life",
				"
					Avanix Life<br/>
					Willkommen auf unserem Server<br/>
					für Fragen und Anregungen benutzt bitte unser Forum<br/><br/>
					
					WWW.FORUM.AVANIX-GAMING.DE<br/><br/>
					
					
					oder schaut in unserem TS vorbei:<br/>
					ts.avanix-gaming.de<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Changelog",
				"
					Den aktuellen Changelog findet ihr in unserem Forum unter forum.avanix-gaming.de
				"
		]
	];
	
	player createDiaryRecord["preise",
		[
			"Preise und Jobs",
				"
					
					<font color='#FF0000'>Hauspreise</font><br/><br/>
					Garage = 15.000€ pro Tag<br/>
					Steinhaus = 27.500€ pro Tag<br/>
					Haus Klein = 30.000€ pro Tag<br/>
					Bungalow Klein = 34.000€ pro Tag<br/>
					Bungalow Gross = 38.000€ pro Tag<br/>
					Haus Mittel = 45.000€ pro Tag<br/>
					Haus Gross = 56.000€ pro Tag<br/>
					Um ein Haus mieten zu können brauchst du eine Hausbesitzerurkunde und das Geld für das Haus auf dem Konto<br/>
					
					<font color='#FF0000'>Lizenz und Führerscheinpreise</font><br/><br/>
					Führerscheine<br/>
					Bootsschein: 1.000€<br/>
					PKW Führerschein: 1.000€<br/>
					Taucherschein: 5.000€<br/>
					LKW Führerschein: 25.000€<br/>
					Pilotenschein: 30.000€<br/>
					Taxischein: 80.000€<br/><br/>
					
					Legale Lizenzen:<br/><br/>
					Salz Verarbeitung: 28.400€<br/>
					Zucker Verarbeitung: 27.900€<br/>
					Holz Verarbeitung: 24.800€<br/>
					Rohöl Verarbeitung: 24.000€<br/>
					Baumwolle Verarbeitung: 25.200€<br/>
					Sand Verarbeitung: 22.100€<br/>
					Stein Verarbeitung: 22.400€<br/>
					Kupfer Verarbeitung: 23.100€<br/>
					Eisen Verarbeitung: 24.300€<br/>
					Blei Lizenz: 24.900€<br/>
					Gold Verarbeitung: 36.900€<br/><br/>
					
					Illegale Lizenzen:<br/><br/>
					Heroin Verarbeitung: 55.000€<br/>
					Marijuana Verarbeitung: 68.000€<br/>
					
					Waffenschein: 100.000€<br/>
					Schwarzmarktlizenz: 2.000.000€<br/><br/>
					Legale Lizenzen und Führerscheine findest du an allen 4 Marktplätzen!<br/>
					illegale Lizenzen findest du an einen der beiden Drogendealern!<br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Regeln", 
				"
					Um immer auf dem aktuellen Stand unseres Regelwerks zu sein schau in unserem Forum http://forum.avanix-gaming.de vorbei!<br/>
				"
		]
	];
	
	// Controls Section
	player createDiaryRecord ["controls",
		[
			"Steuerung",
				"
				Die meissten Aktionen machst du mit der linken Windowstaste! Alle anderen findest du hier:<br/><br/>
				Z: Spielermenu oeffnen<br/>
				U: Oeffnen und abschliessen eines Fahrzeugs/Hauses<br/>
				F: Sirene/Hupe<br/>
				T: Fahrzeugkofferraum<br/>
				0: Schranken öffnen<br/>
				Tab: Lautstärke Laut/Leise<br/>
				Links Shift + H: Waffen holstern<br/>
				Links STRG + H: Waffen ziehen<br/>
				Links Shift + Leertaste: Springen<br/>
				Links Shift + L: Aktiviert Sirenenlicht<br/>
				Links Shift + G: Jemanden niederschlagen (Nur fuer Zivilisten)<br/>
				Links Shift + R: Jemanden fesseln (Polizei und Zivilisten)<br/>
				Links Shift + O: Tore öffnen<br/>
				Links Windows: Hauptinteraktionsmenu<br/>
				Links Windows + T: Aufheben von Geld oder Items<br/>
				Links Shift + V: Hände hoch nehmen!<br/><br/>
				
				Animation:<br/><br/>
				Links Shift	+ Numpad 1:	Hi!<br/>	
				Links Shift	+ Numpad 2:	Hallo<br/>	
				Links Shift	+ Numpad 3:	Hier!<br/>	
				Links Shift	+ Numpad 4: Hilfe!<br/>	
				Links Shift + Numpad 7: Stop!<br/><br/>					
				"
		]
	];