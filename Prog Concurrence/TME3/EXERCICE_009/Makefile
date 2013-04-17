LIBGRAPH		= /Infos/lmd/2005/licence/ue/li221-2005oct/C_graphique/lib/libgraphics.a
GRAPH_LOC	=.

LIBS	= -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lpango-1.0 -lgobject-2.0 -lgmodule-2.0 -ldl -lglib-2.0  


triangle:*.adb
	gnatmake triangle -I$(GRAPH_LOC) -bargs -largs $(LIBGRAPH) `pkg-config --cflags gtk+-2.0` $(LIBS) -lpthread

clean:
	rm -f *.ali *.o triangle

distrib:
	tar czfv /Users/fko/Desktop/tst_graphique.tgz *.ad[sb] Makefile