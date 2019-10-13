{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Import data**\n",
    "By using read.csv() function import test and train data."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a"
   },
   "outputs": [],
   "source": [
    "train <- read.csv(\"../input/titanic/train.csv\")\n",
    "test <- read.csv(\"../input/titanic/test.csv\")"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Size of train and test data**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<ol class=list-inline>\n",
       "\t<li>891</li>\n",
       "\t<li>12</li>\n",
       "</ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 891\n",
       "\\item 12\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 891\n",
       "2. 12\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 891  12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<ol class=list-inline>\n",
       "\t<li>418</li>\n",
       "\t<li>11</li>\n",
       "</ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 418\n",
       "\\item 11\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 418\n",
       "2. 11\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 418  11"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "dim(train)\n",
    "dim(test)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Check first five rows of train data**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table>\n",
       "<caption>A data.frame: 6 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>PassengerId</th><th scope=col>Survived</th><th scope=col>Pclass</th><th scope=col>Name</th><th scope=col>Sex</th><th scope=col>Age</th><th scope=col>SibSp</th><th scope=col>Parch</th><th scope=col>Ticket</th><th scope=col>Fare</th><th scope=col>Cabin</th><th scope=col>Embarked</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>0</td><td>3</td><td>Braund, Mr. Owen Harris                            </td><td>male  </td><td>22</td><td>1</td><td>0</td><td>A/5 21171       </td><td> 7.2500</td><td>    </td><td>S</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>2</td><td>1</td><td>1</td><td>Cumings, Mrs. John Bradley (Florence Briggs Thayer)</td><td>female</td><td>38</td><td>1</td><td>0</td><td>PC 17599        </td><td>71.2833</td><td>C85 </td><td>C</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>3</td><td>1</td><td>3</td><td>Heikkinen, Miss. Laina                             </td><td>female</td><td>26</td><td>0</td><td>0</td><td>STON/O2. 3101282</td><td> 7.9250</td><td>    </td><td>S</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4</td><td>1</td><td>1</td><td>Futrelle, Mrs. Jacques Heath (Lily May Peel)       </td><td>female</td><td>35</td><td>1</td><td>0</td><td>113803          </td><td>53.1000</td><td>C123</td><td>S</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5</td><td>0</td><td>3</td><td>Allen, Mr. William Henry                           </td><td>male  </td><td>35</td><td>0</td><td>0</td><td>373450          </td><td> 8.0500</td><td>    </td><td>S</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>6</td><td>0</td><td>3</td><td>Moran, Mr. James                                   </td><td>male  </td><td>NA</td><td>0</td><td>0</td><td>330877          </td><td> 8.4583</td><td>    </td><td>Q</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 12\n",
       "\\begin{tabular}{r|llllllllllll}\n",
       "  & PassengerId & Survived & Pclass & Name & Sex & Age & SibSp & Parch & Ticket & Fare & Cabin & Embarked\\\\\n",
       "  & <int> & <int> & <int> & <fct> & <fct> & <dbl> & <int> & <int> & <fct> & <dbl> & <fct> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 1 & 0 & 3 & Braund, Mr. Owen Harris                             & male   & 22 & 1 & 0 & A/5 21171        &  7.2500 &      & S\\\\\n",
       "\t2 & 2 & 1 & 1 & Cumings, Mrs. John Bradley (Florence Briggs Thayer) & female & 38 & 1 & 0 & PC 17599         & 71.2833 & C85  & C\\\\\n",
       "\t3 & 3 & 1 & 3 & Heikkinen, Miss. Laina                              & female & 26 & 0 & 0 & STON/O2. 3101282 &  7.9250 &      & S\\\\\n",
       "\t4 & 4 & 1 & 1 & Futrelle, Mrs. Jacques Heath (Lily May Peel)        & female & 35 & 1 & 0 & 113803           & 53.1000 & C123 & S\\\\\n",
       "\t5 & 5 & 0 & 3 & Allen, Mr. William Henry                            & male   & 35 & 0 & 0 & 373450           &  8.0500 &      & S\\\\\n",
       "\t6 & 6 & 0 & 3 & Moran, Mr. James                                    & male   & NA & 0 & 0 & 330877           &  8.4583 &      & Q\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 12\n",
       "\n",
       "| <!--/--> | PassengerId &lt;int&gt; | Survived &lt;int&gt; | Pclass &lt;int&gt; | Name &lt;fct&gt; | Sex &lt;fct&gt; | Age &lt;dbl&gt; | SibSp &lt;int&gt; | Parch &lt;int&gt; | Ticket &lt;fct&gt; | Fare &lt;dbl&gt; | Cabin &lt;fct&gt; | Embarked &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1 | 0 | 3 | Braund, Mr. Owen Harris                             | male   | 22 | 1 | 0 | A/5 21171        |  7.2500 | <!----> | S |\n",
       "| 2 | 2 | 1 | 1 | Cumings, Mrs. John Bradley (Florence Briggs Thayer) | female | 38 | 1 | 0 | PC 17599         | 71.2833 | C85  | C |\n",
       "| 3 | 3 | 1 | 3 | Heikkinen, Miss. Laina                              | female | 26 | 0 | 0 | STON/O2. 3101282 |  7.9250 | <!----> | S |\n",
       "| 4 | 4 | 1 | 1 | Futrelle, Mrs. Jacques Heath (Lily May Peel)        | female | 35 | 1 | 0 | 113803           | 53.1000 | C123 | S |\n",
       "| 5 | 5 | 0 | 3 | Allen, Mr. William Henry                            | male   | 35 | 0 | 0 | 373450           |  8.0500 | <!----> | S |\n",
       "| 6 | 6 | 0 | 3 | Moran, Mr. James                                    | male   | NA | 0 | 0 | 330877           |  8.4583 | <!----> | Q |\n",
       "\n"
      ],
      "text/plain": [
       "  PassengerId Survived Pclass\n",
       "1 1           0        3     \n",
       "2 2           1        1     \n",
       "3 3           1        3     \n",
       "4 4           1        1     \n",
       "5 5           0        3     \n",
       "6 6           0        3     \n",
       "  Name                                                Sex    Age SibSp Parch\n",
       "1 Braund, Mr. Owen Harris                             male   22  1     0    \n",
       "2 Cumings, Mrs. John Bradley (Florence Briggs Thayer) female 38  1     0    \n",
       "3 Heikkinen, Miss. Laina                              female 26  0     0    \n",
       "4 Futrelle, Mrs. Jacques Heath (Lily May Peel)        female 35  1     0    \n",
       "5 Allen, Mr. William Henry                            male   35  0     0    \n",
       "6 Moran, Mr. James                                    male   NA  0     0    \n",
       "  Ticket           Fare    Cabin Embarked\n",
       "1 A/5 21171         7.2500       S       \n",
       "2 PC 17599         71.2833 C85   C       \n",
       "3 STON/O2. 3101282  7.9250       S       \n",
       "4 113803           53.1000 C123  S       \n",
       "5 373450            8.0500       S       \n",
       "6 330877            8.4583       Q       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(train)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Check five rows of test data**\n",
    "\n",
    "Survived variable not present in test data so that mean we need to pridict survived variable, who will be survived or not."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table>\n",
       "<caption>A data.frame: 6 × 11</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>PassengerId</th><th scope=col>Pclass</th><th scope=col>Name</th><th scope=col>Sex</th><th scope=col>Age</th><th scope=col>SibSp</th><th scope=col>Parch</th><th scope=col>Ticket</th><th scope=col>Fare</th><th scope=col>Cabin</th><th scope=col>Embarked</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>892</td><td>3</td><td>Kelly, Mr. James                            </td><td>male  </td><td>34.5</td><td>0</td><td>0</td><td>330911 </td><td> 7.8292</td><td></td><td>Q</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>893</td><td>3</td><td>Wilkes, Mrs. James (Ellen Needs)            </td><td>female</td><td>47.0</td><td>1</td><td>0</td><td>363272 </td><td> 7.0000</td><td></td><td>S</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>894</td><td>2</td><td>Myles, Mr. Thomas Francis                   </td><td>male  </td><td>62.0</td><td>0</td><td>0</td><td>240276 </td><td> 9.6875</td><td></td><td>Q</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>895</td><td>3</td><td>Wirz, Mr. Albert                            </td><td>male  </td><td>27.0</td><td>0</td><td>0</td><td>315154 </td><td> 8.6625</td><td></td><td>S</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>896</td><td>3</td><td>Hirvonen, Mrs. Alexander (Helga E Lindqvist)</td><td>female</td><td>22.0</td><td>1</td><td>1</td><td>3101298</td><td>12.2875</td><td></td><td>S</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>897</td><td>3</td><td>Svensson, Mr. Johan Cervin                  </td><td>male  </td><td>14.0</td><td>0</td><td>0</td><td>7538   </td><td> 9.2250</td><td></td><td>S</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 11\n",
       "\\begin{tabular}{r|lllllllllll}\n",
       "  & PassengerId & Pclass & Name & Sex & Age & SibSp & Parch & Ticket & Fare & Cabin & Embarked\\\\\n",
       "  & <int> & <int> & <fct> & <fct> & <dbl> & <int> & <int> & <fct> & <dbl> & <fct> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 892 & 3 & Kelly, Mr. James                             & male   & 34.5 & 0 & 0 & 330911  &  7.8292 &  & Q\\\\\n",
       "\t2 & 893 & 3 & Wilkes, Mrs. James (Ellen Needs)             & female & 47.0 & 1 & 0 & 363272  &  7.0000 &  & S\\\\\n",
       "\t3 & 894 & 2 & Myles, Mr. Thomas Francis                    & male   & 62.0 & 0 & 0 & 240276  &  9.6875 &  & Q\\\\\n",
       "\t4 & 895 & 3 & Wirz, Mr. Albert                             & male   & 27.0 & 0 & 0 & 315154  &  8.6625 &  & S\\\\\n",
       "\t5 & 896 & 3 & Hirvonen, Mrs. Alexander (Helga E Lindqvist) & female & 22.0 & 1 & 1 & 3101298 & 12.2875 &  & S\\\\\n",
       "\t6 & 897 & 3 & Svensson, Mr. Johan Cervin                   & male   & 14.0 & 0 & 0 & 7538    &  9.2250 &  & S\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 11\n",
       "\n",
       "| <!--/--> | PassengerId &lt;int&gt; | Pclass &lt;int&gt; | Name &lt;fct&gt; | Sex &lt;fct&gt; | Age &lt;dbl&gt; | SibSp &lt;int&gt; | Parch &lt;int&gt; | Ticket &lt;fct&gt; | Fare &lt;dbl&gt; | Cabin &lt;fct&gt; | Embarked &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 892 | 3 | Kelly, Mr. James                             | male   | 34.5 | 0 | 0 | 330911  |  7.8292 | <!----> | Q |\n",
       "| 2 | 893 | 3 | Wilkes, Mrs. James (Ellen Needs)             | female | 47.0 | 1 | 0 | 363272  |  7.0000 | <!----> | S |\n",
       "| 3 | 894 | 2 | Myles, Mr. Thomas Francis                    | male   | 62.0 | 0 | 0 | 240276  |  9.6875 | <!----> | Q |\n",
       "| 4 | 895 | 3 | Wirz, Mr. Albert                             | male   | 27.0 | 0 | 0 | 315154  |  8.6625 | <!----> | S |\n",
       "| 5 | 896 | 3 | Hirvonen, Mrs. Alexander (Helga E Lindqvist) | female | 22.0 | 1 | 1 | 3101298 | 12.2875 | <!----> | S |\n",
       "| 6 | 897 | 3 | Svensson, Mr. Johan Cervin                   | male   | 14.0 | 0 | 0 | 7538    |  9.2250 | <!----> | S |\n",
       "\n"
      ],
      "text/plain": [
       "  PassengerId Pclass Name                                         Sex    Age \n",
       "1 892         3      Kelly, Mr. James                             male   34.5\n",
       "2 893         3      Wilkes, Mrs. James (Ellen Needs)             female 47.0\n",
       "3 894         2      Myles, Mr. Thomas Francis                    male   62.0\n",
       "4 895         3      Wirz, Mr. Albert                             male   27.0\n",
       "5 896         3      Hirvonen, Mrs. Alexander (Helga E Lindqvist) female 22.0\n",
       "6 897         3      Svensson, Mr. Johan Cervin                   male   14.0\n",
       "  SibSp Parch Ticket  Fare    Cabin Embarked\n",
       "1 0     0     330911   7.8292       Q       \n",
       "2 1     0     363272   7.0000       S       \n",
       "3 0     0     240276   9.6875       Q       \n",
       "4 0     0     315154   8.6625       S       \n",
       "5 1     1     3101298 12.2875       S       \n",
       "6 0     0     7538     9.2250       S       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(test)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Check the summary of train data**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "  PassengerId       Survived          Pclass     \n",
       " Min.   :  1.0   Min.   :0.0000   Min.   :1.000  \n",
       " 1st Qu.:223.5   1st Qu.:0.0000   1st Qu.:2.000  \n",
       " Median :446.0   Median :0.0000   Median :3.000  \n",
       " Mean   :446.0   Mean   :0.3838   Mean   :2.309  \n",
       " 3rd Qu.:668.5   3rd Qu.:1.0000   3rd Qu.:3.000  \n",
       " Max.   :891.0   Max.   :1.0000   Max.   :3.000  \n",
       "                                                 \n",
       "                                    Name         Sex           Age       \n",
       " Abbing, Mr. Anthony                  :  1   female:314   Min.   : 0.42  \n",
       " Abbott, Mr. Rossmore Edward          :  1   male  :577   1st Qu.:20.12  \n",
       " Abbott, Mrs. Stanton (Rosa Hunt)     :  1                Median :28.00  \n",
       " Abelson, Mr. Samuel                  :  1                Mean   :29.70  \n",
       " Abelson, Mrs. Samuel (Hannah Wizosky):  1                3rd Qu.:38.00  \n",
       " Adahl, Mr. Mauritz Nils Martin       :  1                Max.   :80.00  \n",
       " (Other)                              :885                NA's   :177    \n",
       "     SibSp           Parch             Ticket         Fare       \n",
       " Min.   :0.000   Min.   :0.0000   1601    :  7   Min.   :  0.00  \n",
       " 1st Qu.:0.000   1st Qu.:0.0000   347082  :  7   1st Qu.:  7.91  \n",
       " Median :0.000   Median :0.0000   CA. 2343:  7   Median : 14.45  \n",
       " Mean   :0.523   Mean   :0.3816   3101295 :  6   Mean   : 32.20  \n",
       " 3rd Qu.:1.000   3rd Qu.:0.0000   347088  :  6   3rd Qu.: 31.00  \n",
       " Max.   :8.000   Max.   :6.0000   CA 2144 :  6   Max.   :512.33  \n",
       "                                  (Other) :852                   \n",
       "         Cabin     Embarked\n",
       "            :687    :  2   \n",
       " B96 B98    :  4   C:168   \n",
       " C23 C25 C27:  4   Q: 77   \n",
       " G6         :  4   S:644   \n",
       " C22 C26    :  3           \n",
       " D          :  3           \n",
       " (Other)    :186           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(train)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Check the summary of test data**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "  PassengerId         Pclass     \n",
       " Min.   : 892.0   Min.   :1.000  \n",
       " 1st Qu.: 996.2   1st Qu.:1.000  \n",
       " Median :1100.5   Median :3.000  \n",
       " Mean   :1100.5   Mean   :2.266  \n",
       " 3rd Qu.:1204.8   3rd Qu.:3.000  \n",
       " Max.   :1309.0   Max.   :3.000  \n",
       "                                 \n",
       "                                        Name         Sex           Age       \n",
       " Abbott, Master. Eugene Joseph            :  1   female:152   Min.   : 0.17  \n",
       " Abelseth, Miss. Karen Marie              :  1   male  :266   1st Qu.:21.00  \n",
       " Abelseth, Mr. Olaus Jorgensen            :  1                Median :27.00  \n",
       " Abrahamsson, Mr. Abraham August Johannes :  1                Mean   :30.27  \n",
       " Abrahim, Mrs. Joseph (Sophie Halaut Easu):  1                3rd Qu.:39.00  \n",
       " Aks, Master. Philip Frank                :  1                Max.   :76.00  \n",
       " (Other)                                  :412                NA's   :86     \n",
       "     SibSp            Parch             Ticket         Fare        \n",
       " Min.   :0.0000   Min.   :0.0000   PC 17608:  5   Min.   :  0.000  \n",
       " 1st Qu.:0.0000   1st Qu.:0.0000   113503  :  4   1st Qu.:  7.896  \n",
       " Median :0.0000   Median :0.0000   CA. 2343:  4   Median : 14.454  \n",
       " Mean   :0.4474   Mean   :0.3923   16966   :  3   Mean   : 35.627  \n",
       " 3rd Qu.:1.0000   3rd Qu.:0.0000   220845  :  3   3rd Qu.: 31.500  \n",
       " Max.   :8.0000   Max.   :9.0000   347077  :  3   Max.   :512.329  \n",
       "                                   (Other) :396   NA's   :1        \n",
       "             Cabin     Embarked\n",
       "                :327   C:102   \n",
       " B57 B59 B63 B66:  3   Q: 46   \n",
       " A34            :  2   S:270   \n",
       " B45            :  2           \n",
       " C101           :  2           \n",
       " C116           :  2           \n",
       " (Other)        : 80           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(test)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Structure of train data**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t891 obs. of  12 variables:\n",
      " $ PassengerId: int  1 2 3 4 5 6 7 8 9 10 ...\n",
      " $ Survived   : int  0 1 1 1 0 0 0 0 1 1 ...\n",
      " $ Pclass     : int  3 1 3 1 3 3 1 3 3 2 ...\n",
      " $ Name       : Factor w/ 891 levels \"Abbing, Mr. Anthony\",..: 109 191 358 277 16 559 520 629 417 581 ...\n",
      " $ Sex        : Factor w/ 2 levels \"female\",\"male\": 2 1 1 1 2 2 2 2 1 1 ...\n",
      " $ Age        : num  22 38 26 35 35 NA 54 2 27 14 ...\n",
      " $ SibSp      : int  1 1 0 1 0 0 0 3 0 1 ...\n",
      " $ Parch      : int  0 0 0 0 0 0 0 1 2 0 ...\n",
      " $ Ticket     : Factor w/ 681 levels \"110152\",\"110413\",..: 524 597 670 50 473 276 86 396 345 133 ...\n",
      " $ Fare       : num  7.25 71.28 7.92 53.1 8.05 ...\n",
      " $ Cabin      : Factor w/ 148 levels \"\",\"A10\",\"A14\",..: 1 83 1 57 1 1 131 1 1 1 ...\n",
      " $ Embarked   : Factor w/ 4 levels \"\",\"C\",\"Q\",\"S\": 4 2 4 4 4 3 4 4 4 2 ...\n"
     ]
    }
   ],
   "source": [
    "str(train)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Structure of test data**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t418 obs. of  11 variables:\n",
      " $ PassengerId: int  892 893 894 895 896 897 898 899 900 901 ...\n",
      " $ Pclass     : int  3 3 2 3 3 3 3 2 3 3 ...\n",
      " $ Name       : Factor w/ 418 levels \"Abbott, Master. Eugene Joseph\",..: 210 409 273 414 182 370 85 58 5 104 ...\n",
      " $ Sex        : Factor w/ 2 levels \"female\",\"male\": 2 1 2 2 1 2 1 2 1 2 ...\n",
      " $ Age        : num  34.5 47 62 27 22 14 30 26 18 21 ...\n",
      " $ SibSp      : int  0 1 0 0 1 0 0 1 0 2 ...\n",
      " $ Parch      : int  0 0 0 0 1 0 0 1 0 0 ...\n",
      " $ Ticket     : Factor w/ 363 levels \"110469\",\"110489\",..: 153 222 74 148 139 262 159 85 101 270 ...\n",
      " $ Fare       : num  7.83 7 9.69 8.66 12.29 ...\n",
      " $ Cabin      : Factor w/ 77 levels \"\",\"A11\",\"A18\",..: 1 1 1 1 1 1 1 1 1 1 ...\n",
      " $ Embarked   : Factor w/ 3 levels \"C\",\"Q\",\"S\": 2 3 2 3 3 3 2 3 1 3 ...\n"
     ]
    }
   ],
   "source": [
    "str(test)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Add survived variable**\n",
    "We have to merge train and test data because for data cleaning and feature engineering.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "metadata": {},
   "outputs": [],
   "source": [
    "test$Survived <- NA"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Add one more variable**\n",
    "Easily identify train and test data set so that's why we need to add one - one variable to both train and test data set."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "metadata": {},
   "outputs": [],
   "source": [
    "train$Train <- \"Yes\"\n",
    "test$Train <- \"No\""
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "1**Now again check size of data sets**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<ol class=list-inline>\n",
       "\t<li>891</li>\n",
       "\t<li>13</li>\n",
       "</ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 891\n",
       "\\item 13\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 891\n",
       "2. 13\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 891  13"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<ol class=list-inline>\n",
       "\t<li>418</li>\n",
       "\t<li>13</li>\n",
       "</ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 418\n",
       "\\item 13\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 418\n",
       "2. 13\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 418  13"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "dim(train)\n",
    "dim(test)\n",
    "\n",
    "#Every thing is fine."
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Now merge train and test data set**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "metadata": {},
   "outputs": [],
   "source": [
    "full <- rbind(train, test)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Now again size of full data set**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<ol class=list-inline>\n",
       "\t<li>1309</li>\n",
       "\t<li>13</li>\n",
       "</ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 1309\n",
       "\\item 13\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 1309\n",
       "2. 13\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 1309   13"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "dim(full)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**First five variables**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table>\n",
       "<caption>A data.frame: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>PassengerId</th><th scope=col>Survived</th><th scope=col>Pclass</th><th scope=col>Name</th><th scope=col>Sex</th><th scope=col>Age</th><th scope=col>SibSp</th><th scope=col>Parch</th><th scope=col>Ticket</th><th scope=col>Fare</th><th scope=col>Cabin</th><th scope=col>Embarked</th><th scope=col>Train</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>0</td><td>3</td><td>Braund, Mr. Owen Harris                            </td><td>male  </td><td>22</td><td>1</td><td>0</td><td>A/5 21171       </td><td> 7.2500</td><td>    </td><td>S</td><td>Yes</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>2</td><td>1</td><td>1</td><td>Cumings, Mrs. John Bradley (Florence Briggs Thayer)</td><td>female</td><td>38</td><td>1</td><td>0</td><td>PC 17599        </td><td>71.2833</td><td>C85 </td><td>C</td><td>Yes</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>3</td><td>1</td><td>3</td><td>Heikkinen, Miss. Laina                             </td><td>female</td><td>26</td><td>0</td><td>0</td><td>STON/O2. 3101282</td><td> 7.9250</td><td>    </td><td>S</td><td>Yes</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4</td><td>1</td><td>1</td><td>Futrelle, Mrs. Jacques Heath (Lily May Peel)       </td><td>female</td><td>35</td><td>1</td><td>0</td><td>113803          </td><td>53.1000</td><td>C123</td><td>S</td><td>Yes</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5</td><td>0</td><td>3</td><td>Allen, Mr. William Henry                           </td><td>male  </td><td>35</td><td>0</td><td>0</td><td>373450          </td><td> 8.0500</td><td>    </td><td>S</td><td>Yes</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>6</td><td>0</td><td>3</td><td>Moran, Mr. James                                   </td><td>male  </td><td>NA</td><td>0</td><td>0</td><td>330877          </td><td> 8.4583</td><td>    </td><td>Q</td><td>Yes</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 13\n",
       "\\begin{tabular}{r|lllllllllllll}\n",
       "  & PassengerId & Survived & Pclass & Name & Sex & Age & SibSp & Parch & Ticket & Fare & Cabin & Embarked & Train\\\\\n",
       "  & <int> & <int> & <int> & <fct> & <fct> & <dbl> & <int> & <int> & <fct> & <dbl> & <fct> & <fct> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 1 & 0 & 3 & Braund, Mr. Owen Harris                             & male   & 22 & 1 & 0 & A/5 21171        &  7.2500 &      & S & Yes\\\\\n",
       "\t2 & 2 & 1 & 1 & Cumings, Mrs. John Bradley (Florence Briggs Thayer) & female & 38 & 1 & 0 & PC 17599         & 71.2833 & C85  & C & Yes\\\\\n",
       "\t3 & 3 & 1 & 3 & Heikkinen, Miss. Laina                              & female & 26 & 0 & 0 & STON/O2. 3101282 &  7.9250 &      & S & Yes\\\\\n",
       "\t4 & 4 & 1 & 1 & Futrelle, Mrs. Jacques Heath (Lily May Peel)        & female & 35 & 1 & 0 & 113803           & 53.1000 & C123 & S & Yes\\\\\n",
       "\t5 & 5 & 0 & 3 & Allen, Mr. William Henry                            & male   & 35 & 0 & 0 & 373450           &  8.0500 &      & S & Yes\\\\\n",
       "\t6 & 6 & 0 & 3 & Moran, Mr. James                                    & male   & NA & 0 & 0 & 330877           &  8.4583 &      & Q & Yes\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 13\n",
       "\n",
       "| <!--/--> | PassengerId &lt;int&gt; | Survived &lt;int&gt; | Pclass &lt;int&gt; | Name &lt;fct&gt; | Sex &lt;fct&gt; | Age &lt;dbl&gt; | SibSp &lt;int&gt; | Parch &lt;int&gt; | Ticket &lt;fct&gt; | Fare &lt;dbl&gt; | Cabin &lt;fct&gt; | Embarked &lt;fct&gt; | Train &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1 | 0 | 3 | Braund, Mr. Owen Harris                             | male   | 22 | 1 | 0 | A/5 21171        |  7.2500 | <!----> | S | Yes |\n",
       "| 2 | 2 | 1 | 1 | Cumings, Mrs. John Bradley (Florence Briggs Thayer) | female | 38 | 1 | 0 | PC 17599         | 71.2833 | C85  | C | Yes |\n",
       "| 3 | 3 | 1 | 3 | Heikkinen, Miss. Laina                              | female | 26 | 0 | 0 | STON/O2. 3101282 |  7.9250 | <!----> | S | Yes |\n",
       "| 4 | 4 | 1 | 1 | Futrelle, Mrs. Jacques Heath (Lily May Peel)        | female | 35 | 1 | 0 | 113803           | 53.1000 | C123 | S | Yes |\n",
       "| 5 | 5 | 0 | 3 | Allen, Mr. William Henry                            | male   | 35 | 0 | 0 | 373450           |  8.0500 | <!----> | S | Yes |\n",
       "| 6 | 6 | 0 | 3 | Moran, Mr. James                                    | male   | NA | 0 | 0 | 330877           |  8.4583 | <!----> | Q | Yes |\n",
       "\n"
      ],
      "text/plain": [
       "  PassengerId Survived Pclass\n",
       "1 1           0        3     \n",
       "2 2           1        1     \n",
       "3 3           1        3     \n",
       "4 4           1        1     \n",
       "5 5           0        3     \n",
       "6 6           0        3     \n",
       "  Name                                                Sex    Age SibSp Parch\n",
       "1 Braund, Mr. Owen Harris                             male   22  1     0    \n",
       "2 Cumings, Mrs. John Bradley (Florence Briggs Thayer) female 38  1     0    \n",
       "3 Heikkinen, Miss. Laina                              female 26  0     0    \n",
       "4 Futrelle, Mrs. Jacques Heath (Lily May Peel)        female 35  1     0    \n",
       "5 Allen, Mr. William Henry                            male   35  0     0    \n",
       "6 Moran, Mr. James                                    male   NA  0     0    \n",
       "  Ticket           Fare    Cabin Embarked Train\n",
       "1 A/5 21171         7.2500       S        Yes  \n",
       "2 PC 17599         71.2833 C85   C        Yes  \n",
       "3 STON/O2. 3101282  7.9250       S        Yes  \n",
       "4 113803           53.1000 C123  S        Yes  \n",
       "5 373450            8.0500       S        Yes  \n",
       "6 330877            8.4583       Q        Yes  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(full)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Check the missing variables**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<dl class=dl-horizontal>\n",
       "\t<dt>PassengerId</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Survived</dt>\n",
       "\t\t<dd>418</dd>\n",
       "\t<dt>Pclass</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Name</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Sex</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Age</dt>\n",
       "\t\t<dd>263</dd>\n",
       "\t<dt>SibSp</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Parch</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Ticket</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Fare</dt>\n",
       "\t\t<dd>1</dd>\n",
       "\t<dt>Cabin</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Embarked</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Train</dt>\n",
       "\t\t<dd>0</dd>\n",
       "</dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[PassengerId] 0\n",
       "\\item[Survived] 418\n",
       "\\item[Pclass] 0\n",
       "\\item[Name] 0\n",
       "\\item[Sex] 0\n",
       "\\item[Age] 263\n",
       "\\item[SibSp] 0\n",
       "\\item[Parch] 0\n",
       "\\item[Ticket] 0\n",
       "\\item[Fare] 1\n",
       "\\item[Cabin] 0\n",
       "\\item[Embarked] 0\n",
       "\\item[Train] 0\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "PassengerId\n",
       ":   0Survived\n",
       ":   418Pclass\n",
       ":   0Name\n",
       ":   0Sex\n",
       ":   0Age\n",
       ":   263SibSp\n",
       ":   0Parch\n",
       ":   0Ticket\n",
       ":   0Fare\n",
       ":   1Cabin\n",
       ":   0Embarked\n",
       ":   0Train\n",
       ":   0\n",
       "\n"
      ],
      "text/plain": [
       "PassengerId    Survived      Pclass        Name         Sex         Age \n",
       "          0         418           0           0           0         263 \n",
       "      SibSp       Parch      Ticket        Fare       Cabin    Embarked \n",
       "          0           0           0           1           0           0 \n",
       "      Train \n",
       "          0 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sapply(full, function(x) sum(is.na(x)))"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Check the struture of full data set**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t1309 obs. of  13 variables:\n",
      " $ PassengerId: int  1 2 3 4 5 6 7 8 9 10 ...\n",
      " $ Survived   : int  0 1 1 1 0 0 0 0 1 1 ...\n",
      " $ Pclass     : int  3 1 3 1 3 3 1 3 3 2 ...\n",
      " $ Name       : Factor w/ 1307 levels \"Abbing, Mr. Anthony\",..: 109 191 358 277 16 559 520 629 417 581 ...\n",
      " $ Sex        : Factor w/ 2 levels \"female\",\"male\": 2 1 1 1 2 2 2 2 1 1 ...\n",
      " $ Age        : num  22 38 26 35 35 NA 54 2 27 14 ...\n",
      " $ SibSp      : int  1 1 0 1 0 0 0 3 0 1 ...\n",
      " $ Parch      : int  0 0 0 0 0 0 0 1 2 0 ...\n",
      " $ Ticket     : Factor w/ 929 levels \"110152\",\"110413\",..: 524 597 670 50 473 276 86 396 345 133 ...\n",
      " $ Fare       : num  7.25 71.28 7.92 53.1 8.05 ...\n",
      " $ Cabin      : Factor w/ 187 levels \"\",\"A10\",\"A14\",..: 1 83 1 57 1 1 131 1 1 1 ...\n",
      " $ Embarked   : Factor w/ 4 levels \"\",\"C\",\"Q\",\"S\": 4 2 4 4 4 3 4 4 4 2 ...\n",
      " $ Train      : chr  \"Yes\" \"Yes\" \"Yes\" \"Yes\" ...\n"
     ]
    }
   ],
   "source": [
    "str(full)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**In age variable 263 values are missings**\n",
    "So now we have to fill missing values "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "30"
      ],
      "text/latex": [
       "30"
      ],
      "text/markdown": [
       "30"
      ],
      "text/plain": [
       "[1] 30"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "28"
      ],
      "text/latex": [
       "28"
      ],
      "text/markdown": [
       "28"
      ],
      "text/plain": [
       "[1] 28"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Mean of age variable\n",
    "age_mean <- round(mean(full$Age, na.rm = TRUE), digits = 0)\n",
    "\n",
    "#Midean of age variable.names.names\n",
    "age_midean  <- median(full$Age, na.rm = TRUE)\n",
    "\n",
    "\n",
    "age_mean\n",
    "age_midean"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Fill missing values**\n",
    "Fill missing values of age with mean value"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "263"
      ],
      "text/latex": [
       "263"
      ],
      "text/markdown": [
       "263"
      ],
      "text/plain": [
       "[1] 263"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Check how many values are missing\n",
    "sum(is.na(full$Age))\n",
    "\n",
    "full[is.na(full$Age), \"Age\"] <- age_mean"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Check summary of fare value**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's \n",
       "  0.000   7.896  14.454  33.295  31.275 512.329       1 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<ol class=list-inline>\n",
       "\t<li>7.25</li>\n",
       "\t<li>71.2833</li>\n",
       "\t<li>7.925</li>\n",
       "\t<li>53.1</li>\n",
       "\t<li>8.05</li>\n",
       "\t<li>8.4583</li>\n",
       "</ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 7.25\n",
       "\\item 71.2833\n",
       "\\item 7.925\n",
       "\\item 53.1\n",
       "\\item 8.05\n",
       "\\item 8.4583\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 7.25\n",
       "2. 71.2833\n",
       "3. 7.925\n",
       "4. 53.1\n",
       "5. 8.05\n",
       "6. 8.4583\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1]  7.2500 71.2833  7.9250 53.1000  8.0500  8.4583"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(full$Fare)\n",
    "head(full$Fare)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Fill missing value of Fare variable**\n",
    "Find mean of fare variable"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "metadata": {},
   "outputs": [],
   "source": [
    "mean_fare <- round(mean(full$Fare, na.rm = TRUE), digits = 3)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Now fill missing values of fare**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "metadata": {},
   "outputs": [],
   "source": [
    "full[is.na(full$Fare), \"Fare\"] <- mean_fare"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Check missing values**\n",
    "Now again check missing values"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<dl class=dl-horizontal>\n",
       "\t<dt>PassengerId</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Survived</dt>\n",
       "\t\t<dd>418</dd>\n",
       "\t<dt>Pclass</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Name</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Sex</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Age</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>SibSp</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Parch</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Ticket</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Fare</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Cabin</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Embarked</dt>\n",
       "\t\t<dd>0</dd>\n",
       "\t<dt>Train</dt>\n",
       "\t\t<dd>0</dd>\n",
       "</dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[PassengerId] 0\n",
       "\\item[Survived] 418\n",
       "\\item[Pclass] 0\n",
       "\\item[Name] 0\n",
       "\\item[Sex] 0\n",
       "\\item[Age] 0\n",
       "\\item[SibSp] 0\n",
       "\\item[Parch] 0\n",
       "\\item[Ticket] 0\n",
       "\\item[Fare] 0\n",
       "\\item[Cabin] 0\n",
       "\\item[Embarked] 0\n",
       "\\item[Train] 0\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "PassengerId\n",
       ":   0Survived\n",
       ":   418Pclass\n",
       ":   0Name\n",
       ":   0Sex\n",
       ":   0Age\n",
       ":   0SibSp\n",
       ":   0Parch\n",
       ":   0Ticket\n",
       ":   0Fare\n",
       ":   0Cabin\n",
       ":   0Embarked\n",
       ":   0Train\n",
       ":   0\n",
       "\n"
      ],
      "text/plain": [
       "PassengerId    Survived      Pclass        Name         Sex         Age \n",
       "          0         418           0           0           0           0 \n",
       "      SibSp       Parch      Ticket        Fare       Cabin    Embarked \n",
       "          0           0           0           0           0           0 \n",
       "      Train \n",
       "          0 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sapply(full, function(x) sum(is.na(x)) )\n",
    "       \n",
    "#In survived variables have 418 values are missing, Don't worry about these values"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "3.6.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 1
}
