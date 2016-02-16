TARGETS=all check clean clobber distclean install uninstall
TARGET=all

PREFIX=${DESTDIR}/opt
BINDIR=${PREFIX}/bin
SUBDIRS=

ifeq	(${MAKE},gmake)
	INSTALL=ginstall
else
	INSTALL=install
endif

.PHONY: ${TARGETS} ${SUBDIRS}

all::	show-licenses

${TARGETS}::

clobber distclean:: clean

check::	show-licenses
	./show-licenses ${ARGS}

install:: show-licenses
	${INSTALL} -D show-licenses ${BINDIR}/show-licenses

uninstall::
	${RM} ${BINDIR}/show-licenses

ifneq	(,${SUBDIRS})
${TARGETS}::
	${MAKE} TARGET=$@ ${SUBDIRS}
${SUBDIRS}::
	${MAKE} -C $@ ${TARGET}
endif
