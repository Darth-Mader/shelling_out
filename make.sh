#!/bin/bash
echo "what's the purpose?"
read PURPOSE
echo ""
touch $1
echo '#!/bin/bash' > $1
echo '#############################' >> $1
echo '#' >> $1
echo "# Name: $NAME" >> $1
echo "# Date: $(date)" >> $1
echo "# Purpose: $PURPOSE" >> $1
echo '#' >> $1
echo '#############################


' >>$1

