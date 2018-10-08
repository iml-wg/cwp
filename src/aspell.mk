%.interactive-spellcheck: %.tex
	aspell -t -d en_US -p ./.aspell.en.pws -c $<

%.batch-spellcheck: %.tex
	./spellcheck.sh $<

CHECKFILES := $(wildcard *.tex)
CHECKFILES := $(filter-out authors.tex, $(CHECKFILES))

interactive-spellcheck: $(CHECKFILES:%.tex=%.interactive-spellcheck)
batch-spellcheck: $(CHECKFILES:%.tex=%.batch-spellcheck)

# derived from the lb-aspell-example project

# lb-aspell-example, example for how to use lb-aspell with the LHCb template
# Copyright (C) 2017  Paul Seyfert <pseyfert@cern.ch>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
