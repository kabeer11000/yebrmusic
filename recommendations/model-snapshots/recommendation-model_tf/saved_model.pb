¨÷$
¡(ö'
B
AddV2
x"T
y"T
z"T"
Ttype:
2	
B
AssignVariableOp
resource
value"dtype"
dtypetype
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
Z
BroadcastTo

input"T
shape"Tidx
output"T"	
Ttype"
Tidxtype0:
2	
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype

Cumsum
x"T
axis"Tidx
out"T"
	exclusivebool( "
reversebool( " 
Ttype:
2	"
Tidxtype0:
2	
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
­
GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"

batch_dimsint "
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
.
Identity

input"T
output"T"	
Ttype
:
Less
x"T
y"T
z
"
Ttype:
2	
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	

Max

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
:
Maximum
x"T
y"T
z"T"
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
=
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
U
NotEqual
x"T
y"T
z
"	
Ttype"$
incompatible_shape_errorbool(
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
³
PartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:

Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	

RaggedTensorToTensor
shape"Tshape
values"T
default_value"T:
row_partition_tensors"Tindex*num_row_partition_tensors
result"T"	
Ttype"
Tindextype:
2	"
Tshapetype:
2	"$
num_row_partition_tensorsint(0"#
row_partition_typeslist(string)
b
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:

2	
@
ReadVariableOp
resource
value"dtype"
dtypetype
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
¥
ResourceGather
resource
indices"Tindices
output"dtype"

batch_dimsint "
validate_indicesbool("
dtypetype"
Tindicestype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
.
Rsqrt
x"T
y"T"
Ttype:

2
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
3
Square
x"T
y"T"
Ttype:
2
	
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
¾
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring 
@
StaticRegexFullMatch	
input

output
"
patternstring
ö
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
;
Sub
x"T
y"T
z"T"
Ttype:
2	

Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
Á
UnsortedSegmentSum	
data"T
segment_ids"Tindices
num_segments"Tnumsegments
output"T" 
Ttype:
2	"
Tindicestype:
2	" 
Tnumsegmentstype0:
2	

VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 
E
Where

input"T	
index	"%
Ttype0
:
2	
"serve*2.4.12v2.4.0-49-g85c8b2a817f8ï¾!

searched_embeddings/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:	¬*/
shared_name searched_embeddings/embeddings

2searched_embeddings/embeddings/Read/ReadVariableOpReadVariableOpsearched_embeddings/embeddings*
_output_shapes
:	¬*
dtype0

watched_embeddings/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:	¬*.
shared_namewatched_embeddings/embeddings

1watched_embeddings/embeddings/Read/ReadVariableOpReadVariableOpwatched_embeddings/embeddings*
_output_shapes
:	¬*
dtype0
x
dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
: @*
shared_namedense_1/kernel
q
"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel*
_output_shapes

: @*
dtype0
p
dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_namedense_1/bias
i
 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_output_shapes
:@*
dtype0
x
dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@@*
shared_namedense_2/kernel
q
"dense_2/kernel/Read/ReadVariableOpReadVariableOpdense_2/kernel*
_output_shapes

:@@*
dtype0
p
dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_namedense_2/bias
i
 dense_2/bias/Read/ReadVariableOpReadVariableOpdense_2/bias*
_output_shapes
:@*
dtype0
x
dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@@*
shared_namedense_3/kernel
q
"dense_3/kernel/Read/ReadVariableOpReadVariableOpdense_3/kernel*
_output_shapes

:@@*
dtype0
p
dense_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_namedense_3/bias
i
 dense_3/bias/Read/ReadVariableOpReadVariableOpdense_3/bias*
_output_shapes
:@*
dtype0

dense_3_batch_norm/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*)
shared_namedense_3_batch_norm/gamma

,dense_3_batch_norm/gamma/Read/ReadVariableOpReadVariableOpdense_3_batch_norm/gamma*
_output_shapes
:@*
dtype0

dense_3_batch_norm/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*(
shared_namedense_3_batch_norm/beta

+dense_3_batch_norm/beta/Read/ReadVariableOpReadVariableOpdense_3_batch_norm/beta*
_output_shapes
:@*
dtype0

dense_3_batch_norm/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*/
shared_name dense_3_batch_norm/moving_mean

2dense_3_batch_norm/moving_mean/Read/ReadVariableOpReadVariableOpdense_3_batch_norm/moving_mean*
_output_shapes
:@*
dtype0

"dense_3_batch_norm/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*3
shared_name$"dense_3_batch_norm/moving_variance

6dense_3_batch_norm/moving_variance/Read/ReadVariableOpReadVariableOp"dense_3_batch_norm/moving_variance*
_output_shapes
:@*
dtype0

dense_output/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@¬*$
shared_namedense_output/kernel
|
'dense_output/kernel/Read/ReadVariableOpReadVariableOpdense_output/kernel*
_output_shapes
:	@¬*
dtype0
{
dense_output/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:¬*"
shared_namedense_output/bias
t
%dense_output/bias/Read/ReadVariableOpReadVariableOpdense_output/bias*
_output_shapes	
:¬*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
§
%Adam/searched_embeddings/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	¬*6
shared_name'%Adam/searched_embeddings/embeddings/m
 
9Adam/searched_embeddings/embeddings/m/Read/ReadVariableOpReadVariableOp%Adam/searched_embeddings/embeddings/m*
_output_shapes
:	¬*
dtype0
¥
$Adam/watched_embeddings/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	¬*5
shared_name&$Adam/watched_embeddings/embeddings/m

8Adam/watched_embeddings/embeddings/m/Read/ReadVariableOpReadVariableOp$Adam/watched_embeddings/embeddings/m*
_output_shapes
:	¬*
dtype0

Adam/dense_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
: @*&
shared_nameAdam/dense_1/kernel/m

)Adam/dense_1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_1/kernel/m*
_output_shapes

: @*
dtype0
~
Adam/dense_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*$
shared_nameAdam/dense_1/bias/m
w
'Adam/dense_1/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_1/bias/m*
_output_shapes
:@*
dtype0

Adam/dense_2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@@*&
shared_nameAdam/dense_2/kernel/m

)Adam/dense_2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_2/kernel/m*
_output_shapes

:@@*
dtype0
~
Adam/dense_2/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*$
shared_nameAdam/dense_2/bias/m
w
'Adam/dense_2/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_2/bias/m*
_output_shapes
:@*
dtype0

Adam/dense_3/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@@*&
shared_nameAdam/dense_3/kernel/m

)Adam/dense_3/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_3/kernel/m*
_output_shapes

:@@*
dtype0
~
Adam/dense_3/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*$
shared_nameAdam/dense_3/bias/m
w
'Adam/dense_3/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_3/bias/m*
_output_shapes
:@*
dtype0

Adam/dense_3_batch_norm/gamma/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*0
shared_name!Adam/dense_3_batch_norm/gamma/m

3Adam/dense_3_batch_norm/gamma/m/Read/ReadVariableOpReadVariableOpAdam/dense_3_batch_norm/gamma/m*
_output_shapes
:@*
dtype0

Adam/dense_3_batch_norm/beta/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*/
shared_name Adam/dense_3_batch_norm/beta/m

2Adam/dense_3_batch_norm/beta/m/Read/ReadVariableOpReadVariableOpAdam/dense_3_batch_norm/beta/m*
_output_shapes
:@*
dtype0

Adam/dense_output/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@¬*+
shared_nameAdam/dense_output/kernel/m

.Adam/dense_output/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_output/kernel/m*
_output_shapes
:	@¬*
dtype0

Adam/dense_output/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:¬*)
shared_nameAdam/dense_output/bias/m

,Adam/dense_output/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_output/bias/m*
_output_shapes	
:¬*
dtype0
§
%Adam/searched_embeddings/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	¬*6
shared_name'%Adam/searched_embeddings/embeddings/v
 
9Adam/searched_embeddings/embeddings/v/Read/ReadVariableOpReadVariableOp%Adam/searched_embeddings/embeddings/v*
_output_shapes
:	¬*
dtype0
¥
$Adam/watched_embeddings/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	¬*5
shared_name&$Adam/watched_embeddings/embeddings/v

8Adam/watched_embeddings/embeddings/v/Read/ReadVariableOpReadVariableOp$Adam/watched_embeddings/embeddings/v*
_output_shapes
:	¬*
dtype0

Adam/dense_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
: @*&
shared_nameAdam/dense_1/kernel/v

)Adam/dense_1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_1/kernel/v*
_output_shapes

: @*
dtype0
~
Adam/dense_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*$
shared_nameAdam/dense_1/bias/v
w
'Adam/dense_1/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_1/bias/v*
_output_shapes
:@*
dtype0

Adam/dense_2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@@*&
shared_nameAdam/dense_2/kernel/v

)Adam/dense_2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_2/kernel/v*
_output_shapes

:@@*
dtype0
~
Adam/dense_2/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*$
shared_nameAdam/dense_2/bias/v
w
'Adam/dense_2/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_2/bias/v*
_output_shapes
:@*
dtype0

Adam/dense_3/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@@*&
shared_nameAdam/dense_3/kernel/v

)Adam/dense_3/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_3/kernel/v*
_output_shapes

:@@*
dtype0
~
Adam/dense_3/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*$
shared_nameAdam/dense_3/bias/v
w
'Adam/dense_3/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_3/bias/v*
_output_shapes
:@*
dtype0

Adam/dense_3_batch_norm/gamma/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*0
shared_name!Adam/dense_3_batch_norm/gamma/v

3Adam/dense_3_batch_norm/gamma/v/Read/ReadVariableOpReadVariableOpAdam/dense_3_batch_norm/gamma/v*
_output_shapes
:@*
dtype0

Adam/dense_3_batch_norm/beta/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*/
shared_name Adam/dense_3_batch_norm/beta/v

2Adam/dense_3_batch_norm/beta/v/Read/ReadVariableOpReadVariableOpAdam/dense_3_batch_norm/beta/v*
_output_shapes
:@*
dtype0

Adam/dense_output/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@¬*+
shared_nameAdam/dense_output/kernel/v

.Adam/dense_output/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_output/kernel/v*
_output_shapes
:	@¬*
dtype0

Adam/dense_output/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:¬*)
shared_nameAdam/dense_output/bias/v

,Adam/dense_output/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_output/bias/v*
_output_shapes	
:¬*
dtype0

NoOpNoOp
S
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*ÂR
value¸RBµR B®R
ï
layer-0
layer-1
layer_with_weights-0
layer-2
layer_with_weights-1
layer-3
layer-4
layer-5
layer-6
layer_with_weights-2
layer-7
	layer-8

layer_with_weights-3

layer-9
layer-10
layer_with_weights-4
layer-11
layer-12
layer_with_weights-5
layer-13
layer_with_weights-6
layer-14
	optimizer
trainable_variables
regularization_losses
	variables
	keras_api

signatures
 
 
b

embeddings
trainable_variables
regularization_losses
	variables
	keras_api
b

embeddings
trainable_variables
regularization_losses
	variables
	keras_api
R
 trainable_variables
!regularization_losses
"	variables
#	keras_api
R
$trainable_variables
%regularization_losses
&	variables
'	keras_api
R
(trainable_variables
)regularization_losses
*	variables
+	keras_api
h

,kernel
-bias
.trainable_variables
/regularization_losses
0	variables
1	keras_api
R
2trainable_variables
3regularization_losses
4	variables
5	keras_api
h

6kernel
7bias
8trainable_variables
9regularization_losses
:	variables
;	keras_api
R
<trainable_variables
=regularization_losses
>	variables
?	keras_api
h

@kernel
Abias
Btrainable_variables
Cregularization_losses
D	variables
E	keras_api
R
Ftrainable_variables
Gregularization_losses
H	variables
I	keras_api

Jaxis
	Kgamma
Lbeta
Mmoving_mean
Nmoving_variance
Otrainable_variables
Pregularization_losses
Q	variables
R	keras_api
h

Skernel
Tbias
Utrainable_variables
Vregularization_losses
W	variables
X	keras_api
°
Yiter

Zbeta_1

[beta_2
	\decay
]learning_ratem©mª,m«-m¬6m­7m®@m¯Am°Km±Lm²Sm³Tm´vµv¶,v·-v¸6v¹7vº@v»Av¼Kv½Lv¾Sv¿TvÀ
V
0
1
,2
-3
64
75
@6
A7
K8
L9
S10
T11
 
f
0
1
,2
-3
64
75
@6
A7
K8
L9
M10
N11
S12
T13
­
^metrics
_layer_metrics
`layer_regularization_losses
anon_trainable_variables

blayers
trainable_variables
regularization_losses
	variables
 
nl
VARIABLE_VALUEsearched_embeddings/embeddings:layer_with_weights-0/embeddings/.ATTRIBUTES/VARIABLE_VALUE

0
 

0
­
cmetrics
dlayer_metrics
elayer_regularization_losses
fnon_trainable_variables

glayers
trainable_variables
regularization_losses
	variables
mk
VARIABLE_VALUEwatched_embeddings/embeddings:layer_with_weights-1/embeddings/.ATTRIBUTES/VARIABLE_VALUE

0
 

0
­
hmetrics
ilayer_metrics
jlayer_regularization_losses
knon_trainable_variables

llayers
trainable_variables
regularization_losses
	variables
 
 
 
­
mmetrics
nlayer_metrics
olayer_regularization_losses
pnon_trainable_variables

qlayers
 trainable_variables
!regularization_losses
"	variables
 
 
 
­
rmetrics
slayer_metrics
tlayer_regularization_losses
unon_trainable_variables

vlayers
$trainable_variables
%regularization_losses
&	variables
 
 
 
­
wmetrics
xlayer_metrics
ylayer_regularization_losses
znon_trainable_variables

{layers
(trainable_variables
)regularization_losses
*	variables
ZX
VARIABLE_VALUEdense_1/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE
VT
VARIABLE_VALUEdense_1/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE

,0
-1
 

,0
-1
®
|metrics
}layer_metrics
~layer_regularization_losses
non_trainable_variables
layers
.trainable_variables
/regularization_losses
0	variables
 
 
 
²
metrics
layer_metrics
 layer_regularization_losses
non_trainable_variables
layers
2trainable_variables
3regularization_losses
4	variables
ZX
VARIABLE_VALUEdense_2/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE
VT
VARIABLE_VALUEdense_2/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE

60
71
 

60
71
²
metrics
layer_metrics
 layer_regularization_losses
non_trainable_variables
layers
8trainable_variables
9regularization_losses
:	variables
 
 
 
²
metrics
layer_metrics
 layer_regularization_losses
non_trainable_variables
layers
<trainable_variables
=regularization_losses
>	variables
ZX
VARIABLE_VALUEdense_3/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE
VT
VARIABLE_VALUEdense_3/bias4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUE

@0
A1
 

@0
A1
²
metrics
layer_metrics
 layer_regularization_losses
non_trainable_variables
layers
Btrainable_variables
Cregularization_losses
D	variables
 
 
 
²
metrics
layer_metrics
 layer_regularization_losses
non_trainable_variables
layers
Ftrainable_variables
Gregularization_losses
H	variables
 
ca
VARIABLE_VALUEdense_3_batch_norm/gamma5layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUE
a_
VARIABLE_VALUEdense_3_batch_norm/beta4layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUE
om
VARIABLE_VALUEdense_3_batch_norm/moving_mean;layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUE
wu
VARIABLE_VALUE"dense_3_batch_norm/moving_variance?layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUE

K0
L1
 

K0
L1
M2
N3
²
metrics
layer_metrics
 layer_regularization_losses
non_trainable_variables
layers
Otrainable_variables
Pregularization_losses
Q	variables
_]
VARIABLE_VALUEdense_output/kernel6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE
[Y
VARIABLE_VALUEdense_output/bias4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUE

S0
T1
 

S0
T1
²
metrics
 layer_metrics
 ¡layer_regularization_losses
¢non_trainable_variables
£layers
Utrainable_variables
Vregularization_losses
W	variables
HF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE

¤0
 
 

M0
N1
n
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

M0
N1
 
 
 
 
 
 
8

¥total

¦count
§	variables
¨	keras_api
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

¥0
¦1

§	variables

VARIABLE_VALUE%Adam/searched_embeddings/embeddings/mVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUE$Adam/watched_embeddings/embeddings/mVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/dense_1/kernel/mRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/dense_1/bias/mPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/dense_2/kernel/mRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/dense_2/bias/mPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/dense_3/kernel/mRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/dense_3/bias/mPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUEAdam/dense_3_batch_norm/gamma/mQlayer_with_weights-5/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUEAdam/dense_3_batch_norm/beta/mPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUEAdam/dense_output/kernel/mRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/dense_output/bias/mPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUE%Adam/searched_embeddings/embeddings/vVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUE$Adam/watched_embeddings/embeddings/vVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/dense_1/kernel/vRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/dense_1/bias/vPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/dense_2/kernel/vRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/dense_2/bias/vPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/dense_3/kernel/vRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/dense_3/bias/vPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUEAdam/dense_3_batch_norm/gamma/vQlayer_with_weights-5/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUEAdam/dense_3_batch_norm/beta/vPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE

VARIABLE_VALUEAdam/dense_output/kernel/vRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/dense_output/bias/vPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE

serving_default_search_queryPlaceholder*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
dtype0*%
shape:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

serving_default_watch_historyPlaceholder*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
dtype0*%
shape:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
«
StatefulPartitionedCallStatefulPartitionedCallserving_default_search_queryserving_default_watch_historywatched_embeddings/embeddingssearched_embeddings/embeddingsdense_1/kerneldense_1/biasdense_2/kerneldense_2/biasdense_3/kerneldense_3/bias"dense_3_batch_norm/moving_variancedense_3_batch_norm/gammadense_3_batch_norm/moving_meandense_3_batch_norm/betadense_output/kerneldense_output/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8 *,
f'R%
#__inference_signature_wrapper_15504
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
æ
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename2searched_embeddings/embeddings/Read/ReadVariableOp1watched_embeddings/embeddings/Read/ReadVariableOp"dense_1/kernel/Read/ReadVariableOp dense_1/bias/Read/ReadVariableOp"dense_2/kernel/Read/ReadVariableOp dense_2/bias/Read/ReadVariableOp"dense_3/kernel/Read/ReadVariableOp dense_3/bias/Read/ReadVariableOp,dense_3_batch_norm/gamma/Read/ReadVariableOp+dense_3_batch_norm/beta/Read/ReadVariableOp2dense_3_batch_norm/moving_mean/Read/ReadVariableOp6dense_3_batch_norm/moving_variance/Read/ReadVariableOp'dense_output/kernel/Read/ReadVariableOp%dense_output/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOp9Adam/searched_embeddings/embeddings/m/Read/ReadVariableOp8Adam/watched_embeddings/embeddings/m/Read/ReadVariableOp)Adam/dense_1/kernel/m/Read/ReadVariableOp'Adam/dense_1/bias/m/Read/ReadVariableOp)Adam/dense_2/kernel/m/Read/ReadVariableOp'Adam/dense_2/bias/m/Read/ReadVariableOp)Adam/dense_3/kernel/m/Read/ReadVariableOp'Adam/dense_3/bias/m/Read/ReadVariableOp3Adam/dense_3_batch_norm/gamma/m/Read/ReadVariableOp2Adam/dense_3_batch_norm/beta/m/Read/ReadVariableOp.Adam/dense_output/kernel/m/Read/ReadVariableOp,Adam/dense_output/bias/m/Read/ReadVariableOp9Adam/searched_embeddings/embeddings/v/Read/ReadVariableOp8Adam/watched_embeddings/embeddings/v/Read/ReadVariableOp)Adam/dense_1/kernel/v/Read/ReadVariableOp'Adam/dense_1/bias/v/Read/ReadVariableOp)Adam/dense_2/kernel/v/Read/ReadVariableOp'Adam/dense_2/bias/v/Read/ReadVariableOp)Adam/dense_3/kernel/v/Read/ReadVariableOp'Adam/dense_3/bias/v/Read/ReadVariableOp3Adam/dense_3_batch_norm/gamma/v/Read/ReadVariableOp2Adam/dense_3_batch_norm/beta/v/Read/ReadVariableOp.Adam/dense_output/kernel/v/Read/ReadVariableOp,Adam/dense_output/bias/v/Read/ReadVariableOpConst*:
Tin3
12/	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *'
f"R 
__inference__traced_save_16875
Ý

StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamesearched_embeddings/embeddingswatched_embeddings/embeddingsdense_1/kerneldense_1/biasdense_2/kerneldense_2/biasdense_3/kerneldense_3/biasdense_3_batch_norm/gammadense_3_batch_norm/betadense_3_batch_norm/moving_mean"dense_3_batch_norm/moving_variancedense_output/kerneldense_output/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcount%Adam/searched_embeddings/embeddings/m$Adam/watched_embeddings/embeddings/mAdam/dense_1/kernel/mAdam/dense_1/bias/mAdam/dense_2/kernel/mAdam/dense_2/bias/mAdam/dense_3/kernel/mAdam/dense_3/bias/mAdam/dense_3_batch_norm/gamma/mAdam/dense_3_batch_norm/beta/mAdam/dense_output/kernel/mAdam/dense_output/bias/m%Adam/searched_embeddings/embeddings/v$Adam/watched_embeddings/embeddings/vAdam/dense_1/kernel/vAdam/dense_1/bias/vAdam/dense_2/kernel/vAdam/dense_2/bias/vAdam/dense_3/kernel/vAdam/dense_3/bias/vAdam/dense_3_batch_norm/gamma/vAdam/dense_3_batch_norm/beta/vAdam/dense_output/kernel/vAdam/dense_output/bias/v*9
Tin2
02.*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 **
f%R#
!__inference__traced_restore_17020Ôê

H
,__inference_dense_1_relu_layer_call_fn_16556

inputs
identityÅ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_1_relu_layer_call_and_return_conditional_losses_150862
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*&
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs

Á
%__inference_model_layer_call_fn_15696
inputs_0
inputs_1
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
	unknown_8
	unknown_9

unknown_10

unknown_11

unknown_12
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*.
_read_only_resource_inputs
	*-
config_proto

CPU

GPU 2J 8 *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_153432
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2

Identity"
identityIdentity:output:0*
_input_shapesr
p:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ::::::::::::::22
StatefulPartitionedCallStatefulPartitionedCall:Z V
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/0:ZV
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/1
`
ù
__inference__traced_save_16875
file_prefix=
9savev2_searched_embeddings_embeddings_read_readvariableop<
8savev2_watched_embeddings_embeddings_read_readvariableop-
)savev2_dense_1_kernel_read_readvariableop+
'savev2_dense_1_bias_read_readvariableop-
)savev2_dense_2_kernel_read_readvariableop+
'savev2_dense_2_bias_read_readvariableop-
)savev2_dense_3_kernel_read_readvariableop+
'savev2_dense_3_bias_read_readvariableop7
3savev2_dense_3_batch_norm_gamma_read_readvariableop6
2savev2_dense_3_batch_norm_beta_read_readvariableop=
9savev2_dense_3_batch_norm_moving_mean_read_readvariableopA
=savev2_dense_3_batch_norm_moving_variance_read_readvariableop2
.savev2_dense_output_kernel_read_readvariableop0
,savev2_dense_output_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableopD
@savev2_adam_searched_embeddings_embeddings_m_read_readvariableopC
?savev2_adam_watched_embeddings_embeddings_m_read_readvariableop4
0savev2_adam_dense_1_kernel_m_read_readvariableop2
.savev2_adam_dense_1_bias_m_read_readvariableop4
0savev2_adam_dense_2_kernel_m_read_readvariableop2
.savev2_adam_dense_2_bias_m_read_readvariableop4
0savev2_adam_dense_3_kernel_m_read_readvariableop2
.savev2_adam_dense_3_bias_m_read_readvariableop>
:savev2_adam_dense_3_batch_norm_gamma_m_read_readvariableop=
9savev2_adam_dense_3_batch_norm_beta_m_read_readvariableop9
5savev2_adam_dense_output_kernel_m_read_readvariableop7
3savev2_adam_dense_output_bias_m_read_readvariableopD
@savev2_adam_searched_embeddings_embeddings_v_read_readvariableopC
?savev2_adam_watched_embeddings_embeddings_v_read_readvariableop4
0savev2_adam_dense_1_kernel_v_read_readvariableop2
.savev2_adam_dense_1_bias_v_read_readvariableop4
0savev2_adam_dense_2_kernel_v_read_readvariableop2
.savev2_adam_dense_2_bias_v_read_readvariableop4
0savev2_adam_dense_3_kernel_v_read_readvariableop2
.savev2_adam_dense_3_bias_v_read_readvariableop>
:savev2_adam_dense_3_batch_norm_gamma_v_read_readvariableop=
9savev2_adam_dense_3_batch_norm_beta_v_read_readvariableop9
5savev2_adam_dense_output_kernel_v_read_readvariableop7
3savev2_adam_dense_output_bias_v_read_readvariableop
savev2_const

identity_1¢MergeV2Checkpoints
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shard¦
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilenameç
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*ù
valueïBì.B:layer_with_weights-0/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-1/embeddings/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-5/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-5/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_namesä
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*o
valuefBd.B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slicesÁ
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:09savev2_searched_embeddings_embeddings_read_readvariableop8savev2_watched_embeddings_embeddings_read_readvariableop)savev2_dense_1_kernel_read_readvariableop'savev2_dense_1_bias_read_readvariableop)savev2_dense_2_kernel_read_readvariableop'savev2_dense_2_bias_read_readvariableop)savev2_dense_3_kernel_read_readvariableop'savev2_dense_3_bias_read_readvariableop3savev2_dense_3_batch_norm_gamma_read_readvariableop2savev2_dense_3_batch_norm_beta_read_readvariableop9savev2_dense_3_batch_norm_moving_mean_read_readvariableop=savev2_dense_3_batch_norm_moving_variance_read_readvariableop.savev2_dense_output_kernel_read_readvariableop,savev2_dense_output_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop@savev2_adam_searched_embeddings_embeddings_m_read_readvariableop?savev2_adam_watched_embeddings_embeddings_m_read_readvariableop0savev2_adam_dense_1_kernel_m_read_readvariableop.savev2_adam_dense_1_bias_m_read_readvariableop0savev2_adam_dense_2_kernel_m_read_readvariableop.savev2_adam_dense_2_bias_m_read_readvariableop0savev2_adam_dense_3_kernel_m_read_readvariableop.savev2_adam_dense_3_bias_m_read_readvariableop:savev2_adam_dense_3_batch_norm_gamma_m_read_readvariableop9savev2_adam_dense_3_batch_norm_beta_m_read_readvariableop5savev2_adam_dense_output_kernel_m_read_readvariableop3savev2_adam_dense_output_bias_m_read_readvariableop@savev2_adam_searched_embeddings_embeddings_v_read_readvariableop?savev2_adam_watched_embeddings_embeddings_v_read_readvariableop0savev2_adam_dense_1_kernel_v_read_readvariableop.savev2_adam_dense_1_bias_v_read_readvariableop0savev2_adam_dense_2_kernel_v_read_readvariableop.savev2_adam_dense_2_bias_v_read_readvariableop0savev2_adam_dense_3_kernel_v_read_readvariableop.savev2_adam_dense_3_bias_v_read_readvariableop:savev2_adam_dense_3_batch_norm_gamma_v_read_readvariableop9savev2_adam_dense_3_batch_norm_beta_v_read_readvariableop5savev2_adam_dense_output_kernel_v_read_readvariableop3savev2_adam_dense_output_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *<
dtypes2
02.	2
SaveV2º
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixes¡
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identitym

Identity_1IdentityIdentity:output:0^MergeV2Checkpoints*
T0*
_output_shapes
: 2

Identity_1"!

identity_1Identity_1:output:0*ß
_input_shapesÍ
Ê: :	¬:	¬: @:@:@@:@:@@:@:@:@:@:@:	@¬:¬: : : : : : : :	¬:	¬: @:@:@@:@:@@:@:@:@:	@¬:¬:	¬:	¬: @:@:@@:@:@@:@:@:@:	@¬:¬: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:%!

_output_shapes
:	¬:%!

_output_shapes
:	¬:$ 

_output_shapes

: @: 

_output_shapes
:@:$ 

_output_shapes

:@@: 

_output_shapes
:@:$ 

_output_shapes

:@@: 

_output_shapes
:@: 	

_output_shapes
:@: 


_output_shapes
:@: 

_output_shapes
:@: 

_output_shapes
:@:%!

_output_shapes
:	@¬:!

_output_shapes	
:¬:

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :%!

_output_shapes
:	¬:%!

_output_shapes
:	¬:$ 

_output_shapes

: @: 

_output_shapes
:@:$ 

_output_shapes

:@@: 

_output_shapes
:@:$ 

_output_shapes

:@@: 

_output_shapes
:@: 

_output_shapes
:@: 

_output_shapes
:@:% !

_output_shapes
:	@¬:!!

_output_shapes	
:¬:%"!

_output_shapes
:	¬:%#!

_output_shapes
:	¬:$$ 

_output_shapes

: @: %

_output_shapes
:@:$& 

_output_shapes

:@@: '

_output_shapes
:@:$( 

_output_shapes

:@@: )

_output_shapes
:@: *

_output_shapes
:@: +

_output_shapes
:@:%,!

_output_shapes
:	@¬:!-

_output_shapes	
:¬:.

_output_shapes
: 
Ð

M__inference_dense_3_batch_norm_layer_call_and_return_conditional_losses_14693

inputs%
!batchnorm_readvariableop_resource)
%batchnorm_mul_readvariableop_resource'
#batchnorm_readvariableop_1_resource'
#batchnorm_readvariableop_2_resource
identity¢batchnorm/ReadVariableOp¢batchnorm/ReadVariableOp_1¢batchnorm/ReadVariableOp_2¢batchnorm/mul/ReadVariableOp
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOpg
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:2
batchnorm/add/y
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes
:@2
batchnorm/addc
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:@2
batchnorm/Rsqrt
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/mul/ReadVariableOp
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@2
batchnorm/mulv
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
batchnorm/mul_1
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOp_1
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes
:@2
batchnorm/mul_2
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOp_2
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:@2
batchnorm/sub
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
batchnorm/add_1Û
IdentityIdentitybatchnorm/add_1:z:0^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ@::::24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
µ
c
G__inference_dense_2_relu_layer_call_and_return_conditional_losses_15125

inputs
identityN
ReluReluinputs*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
Reluf
IdentityIdentityRelu:activations:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*&
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
	
Û
B__inference_dense_1_layer_call_and_return_conditional_losses_15065

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: @*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
MatMul
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
BiasAdd/ReadVariableOp
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2	
BiasAdd
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ ::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
 
_user_specified_nameinputs

H
,__inference_dense_2_relu_layer_call_fn_16585

inputs
identityÅ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_2_relu_layer_call_and_return_conditional_losses_151252
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*&
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
¡


N__inference_searched_embeddings_layer_call_and_return_conditional_losses_15740

inputs
embedding_lookup_15734
identity¢embedding_lookupf
CastCastinputs*

DstT0*

SrcT0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
Cast
embedding_lookupResourceGatherembedding_lookup_15734Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/15734*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
dtype02
embedding_lookupõ
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/15734*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
embedding_lookup/Identity©
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
embedding_lookup/Identity_1
IdentityIdentity$embedding_lookup/Identity_1:output:0^embedding_lookup*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*3
_input_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:2$
embedding_lookupembedding_lookup:X T
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
»H
ä
@__inference_model_layer_call_and_return_conditional_losses_15235
search_query
watch_history
watched_embeddings_14728
searched_embeddings_14752
dense_1_15076
dense_1_15078
dense_2_15115
dense_2_15117
dense_3_15154
dense_3_15156
dense_3_batch_norm_15198
dense_3_batch_norm_15200
dense_3_batch_norm_15202
dense_3_batch_norm_15204
dense_output_15229
dense_output_15231
identity¢dense_1/StatefulPartitionedCall¢dense_2/StatefulPartitionedCall¢dense_3/StatefulPartitionedCall¢*dense_3_batch_norm/StatefulPartitionedCall¢$dense_output/StatefulPartitionedCall¢+searched_embeddings/StatefulPartitionedCall¢*watched_embeddings/StatefulPartitionedCall»
*watched_embeddings/StatefulPartitionedCallStatefulPartitionedCallwatch_historywatched_embeddings_14728*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_watched_embeddings_layer_call_and_return_conditional_losses_147192,
*watched_embeddings/StatefulPartitionedCall
watched_embeddings/NotEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
watched_embeddings/NotEqual/y¸
watched_embeddings/NotEqualNotEqualwatch_history&watched_embeddings/NotEqual/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
watched_embeddings/NotEqual¾
+searched_embeddings/StatefulPartitionedCallStatefulPartitionedCallsearch_querysearched_embeddings_14752*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *W
fRRP
N__inference_searched_embeddings_layer_call_and_return_conditional_losses_147432-
+searched_embeddings/StatefulPartitionedCall
searched_embeddings/NotEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2 
searched_embeddings/NotEqual/yº
searched_embeddings/NotEqualNotEqualsearch_query'searched_embeddings/NotEqual/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
searched_embeddings/NotEqual²
l2_norm_1/PartitionedCallPartitionedCall3watched_embeddings/StatefulPartitionedCall:output:0watched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_l2_norm_1_layer_call_and_return_conditional_losses_148112
l2_norm_1/PartitionedCall¸
l2_norm_1/PartitionedCall_1PartitionedCall4searched_embeddings/StatefulPartitionedCall:output:0 searched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_l2_norm_1_layer_call_and_return_conditional_losses_148112
l2_norm_1/PartitionedCall_1¸
$aggregate_embeddings/PartitionedCallPartitionedCall$l2_norm_1/PartitionedCall_1:output:0 searched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_aggregate_embeddings_layer_call_and_return_conditional_losses_150292&
$aggregate_embeddings/PartitionedCall¹
&aggregate_embeddings/PartitionedCall_1PartitionedCall"l2_norm_1/PartitionedCall:output:0watched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_aggregate_embeddings_layer_call_and_return_conditional_losses_150292(
&aggregate_embeddings/PartitionedCall_1µ
concatenate/PartitionedCallPartitionedCall-aggregate_embeddings/PartitionedCall:output:0/aggregate_embeddings/PartitionedCall_1:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_concatenate_layer_call_and_return_conditional_losses_150462
concatenate/PartitionedCallª
dense_1/StatefulPartitionedCallStatefulPartitionedCall$concatenate/PartitionedCall:output:0dense_1_15076dense_1_15078*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_150652!
dense_1/StatefulPartitionedCall
dense_1_relu/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_1_relu_layer_call_and_return_conditional_losses_150862
dense_1_relu/PartitionedCall«
dense_2/StatefulPartitionedCallStatefulPartitionedCall%dense_1_relu/PartitionedCall:output:0dense_2_15115dense_2_15117*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_151042!
dense_2/StatefulPartitionedCall
dense_2_relu/PartitionedCallPartitionedCall(dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_2_relu_layer_call_and_return_conditional_losses_151252
dense_2_relu/PartitionedCall«
dense_3/StatefulPartitionedCallStatefulPartitionedCall%dense_2_relu/PartitionedCall:output:0dense_3_15154dense_3_15156*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_151432!
dense_3/StatefulPartitionedCall
dense_3_relu/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_3_relu_layer_call_and_return_conditional_losses_151642
dense_3_relu/PartitionedCall
*dense_3_batch_norm/StatefulPartitionedCallStatefulPartitionedCall%dense_3_relu/PartitionedCall:output:0dense_3_batch_norm_15198dense_3_batch_norm_15200dense_3_batch_norm_15202dense_3_batch_norm_15204*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_dense_3_batch_norm_layer_call_and_return_conditional_losses_146602,
*dense_3_batch_norm/StatefulPartitionedCallÓ
$dense_output/StatefulPartitionedCallStatefulPartitionedCall3dense_3_batch_norm/StatefulPartitionedCall:output:0dense_output_15229dense_output_15231*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_output_layer_call_and_return_conditional_losses_152182&
$dense_output/StatefulPartitionedCall
IdentityIdentity-dense_output/StatefulPartitionedCall:output:0 ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall+^dense_3_batch_norm/StatefulPartitionedCall%^dense_output/StatefulPartitionedCall,^searched_embeddings/StatefulPartitionedCall+^watched_embeddings/StatefulPartitionedCall*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2

Identity"
identityIdentity:output:0*
_input_shapesr
p:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ::::::::::::::2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2X
*dense_3_batch_norm/StatefulPartitionedCall*dense_3_batch_norm/StatefulPartitionedCall2L
$dense_output/StatefulPartitionedCall$dense_output/StatefulPartitionedCall2Z
+searched_embeddings/StatefulPartitionedCall+searched_embeddings/StatefulPartitionedCall2X
*watched_embeddings/StatefulPartitionedCall*watched_embeddings/StatefulPartitionedCall:^ Z
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
&
_user_specified_namesearch_query:_[
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
'
_user_specified_namewatch_history
Ø
|
'__inference_dense_1_layer_call_fn_16546

inputs
unknown
	unknown_0
identity¢StatefulPartitionedCallò
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_150652
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ ::22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
 
_user_specified_nameinputs
½H
ä
@__inference_model_layer_call_and_return_conditional_losses_15287
search_query
watch_history
watched_embeddings_15239
searched_embeddings_15244
dense_1_15254
dense_1_15256
dense_2_15260
dense_2_15262
dense_3_15266
dense_3_15268
dense_3_batch_norm_15272
dense_3_batch_norm_15274
dense_3_batch_norm_15276
dense_3_batch_norm_15278
dense_output_15281
dense_output_15283
identity¢dense_1/StatefulPartitionedCall¢dense_2/StatefulPartitionedCall¢dense_3/StatefulPartitionedCall¢*dense_3_batch_norm/StatefulPartitionedCall¢$dense_output/StatefulPartitionedCall¢+searched_embeddings/StatefulPartitionedCall¢*watched_embeddings/StatefulPartitionedCall»
*watched_embeddings/StatefulPartitionedCallStatefulPartitionedCallwatch_historywatched_embeddings_15239*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_watched_embeddings_layer_call_and_return_conditional_losses_147192,
*watched_embeddings/StatefulPartitionedCall
watched_embeddings/NotEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
watched_embeddings/NotEqual/y¸
watched_embeddings/NotEqualNotEqualwatch_history&watched_embeddings/NotEqual/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
watched_embeddings/NotEqual¾
+searched_embeddings/StatefulPartitionedCallStatefulPartitionedCallsearch_querysearched_embeddings_15244*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *W
fRRP
N__inference_searched_embeddings_layer_call_and_return_conditional_losses_147432-
+searched_embeddings/StatefulPartitionedCall
searched_embeddings/NotEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2 
searched_embeddings/NotEqual/yº
searched_embeddings/NotEqualNotEqualsearch_query'searched_embeddings/NotEqual/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
searched_embeddings/NotEqual²
l2_norm_1/PartitionedCallPartitionedCall3watched_embeddings/StatefulPartitionedCall:output:0watched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_l2_norm_1_layer_call_and_return_conditional_losses_148112
l2_norm_1/PartitionedCall¸
l2_norm_1/PartitionedCall_1PartitionedCall4searched_embeddings/StatefulPartitionedCall:output:0 searched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_l2_norm_1_layer_call_and_return_conditional_losses_148112
l2_norm_1/PartitionedCall_1¸
$aggregate_embeddings/PartitionedCallPartitionedCall$l2_norm_1/PartitionedCall_1:output:0 searched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_aggregate_embeddings_layer_call_and_return_conditional_losses_150292&
$aggregate_embeddings/PartitionedCall¹
&aggregate_embeddings/PartitionedCall_1PartitionedCall"l2_norm_1/PartitionedCall:output:0watched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_aggregate_embeddings_layer_call_and_return_conditional_losses_150292(
&aggregate_embeddings/PartitionedCall_1µ
concatenate/PartitionedCallPartitionedCall-aggregate_embeddings/PartitionedCall:output:0/aggregate_embeddings/PartitionedCall_1:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_concatenate_layer_call_and_return_conditional_losses_150462
concatenate/PartitionedCallª
dense_1/StatefulPartitionedCallStatefulPartitionedCall$concatenate/PartitionedCall:output:0dense_1_15254dense_1_15256*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_150652!
dense_1/StatefulPartitionedCall
dense_1_relu/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_1_relu_layer_call_and_return_conditional_losses_150862
dense_1_relu/PartitionedCall«
dense_2/StatefulPartitionedCallStatefulPartitionedCall%dense_1_relu/PartitionedCall:output:0dense_2_15260dense_2_15262*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_151042!
dense_2/StatefulPartitionedCall
dense_2_relu/PartitionedCallPartitionedCall(dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_2_relu_layer_call_and_return_conditional_losses_151252
dense_2_relu/PartitionedCall«
dense_3/StatefulPartitionedCallStatefulPartitionedCall%dense_2_relu/PartitionedCall:output:0dense_3_15266dense_3_15268*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_151432!
dense_3/StatefulPartitionedCall
dense_3_relu/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_3_relu_layer_call_and_return_conditional_losses_151642
dense_3_relu/PartitionedCall
*dense_3_batch_norm/StatefulPartitionedCallStatefulPartitionedCall%dense_3_relu/PartitionedCall:output:0dense_3_batch_norm_15272dense_3_batch_norm_15274dense_3_batch_norm_15276dense_3_batch_norm_15278*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_dense_3_batch_norm_layer_call_and_return_conditional_losses_146932,
*dense_3_batch_norm/StatefulPartitionedCallÓ
$dense_output/StatefulPartitionedCallStatefulPartitionedCall3dense_3_batch_norm/StatefulPartitionedCall:output:0dense_output_15281dense_output_15283*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_output_layer_call_and_return_conditional_losses_152182&
$dense_output/StatefulPartitionedCall
IdentityIdentity-dense_output/StatefulPartitionedCall:output:0 ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall+^dense_3_batch_norm/StatefulPartitionedCall%^dense_output/StatefulPartitionedCall,^searched_embeddings/StatefulPartitionedCall+^watched_embeddings/StatefulPartitionedCall*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2

Identity"
identityIdentity:output:0*
_input_shapesr
p:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ::::::::::::::2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2X
*dense_3_batch_norm/StatefulPartitionedCall*dense_3_batch_norm/StatefulPartitionedCall2L
$dense_output/StatefulPartitionedCall$dense_output/StatefulPartitionedCall2Z
+searched_embeddings/StatefulPartitionedCall+searched_embeddings/StatefulPartitionedCall2X
*watched_embeddings/StatefulPartitionedCall*watched_embeddings/StatefulPartitionedCall:^ Z
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
&
_user_specified_namesearch_query:_[
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
'
_user_specified_namewatch_history
µ
c
G__inference_dense_3_relu_layer_call_and_return_conditional_losses_15164

inputs
identityN
ReluReluinputs*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
Reluf
IdentityIdentityRelu:activations:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*&
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
O
<
__inference_call_15878

inputs
mask

identity
RaggedMask/boolean_mask/ShapeConst*
_output_shapes
:*
dtype0*!
valueB"         2
RaggedMask/boolean_mask/Shape¤
+RaggedMask/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2-
+RaggedMask/boolean_mask/strided_slice/stack¨
-RaggedMask/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_1¨
-RaggedMask/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_2Þ
%RaggedMask/boolean_mask/strided_sliceStridedSlice&RaggedMask/boolean_mask/Shape:output:04RaggedMask/boolean_mask/strided_slice/stack:output:06RaggedMask/boolean_mask/strided_slice/stack_1:output:06RaggedMask/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2'
%RaggedMask/boolean_mask/strided_sliceª
.RaggedMask/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 20
.RaggedMask/boolean_mask/Prod/reduction_indicesÎ
RaggedMask/boolean_mask/ProdProd.RaggedMask/boolean_mask/strided_slice:output:07RaggedMask/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2
RaggedMask/boolean_mask/Prod
RaggedMask/boolean_mask/Shape_1Const*
_output_shapes
:*
dtype0*!
valueB"         2!
RaggedMask/boolean_mask/Shape_1¨
-RaggedMask/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2/
-RaggedMask/boolean_mask/strided_slice_1/stack¬
/RaggedMask/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_1/stack_1¬
/RaggedMask/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_1/stack_2ú
'RaggedMask/boolean_mask/strided_slice_1StridedSlice(RaggedMask/boolean_mask/Shape_1:output:06RaggedMask/boolean_mask/strided_slice_1/stack:output:08RaggedMask/boolean_mask/strided_slice_1/stack_1:output:08RaggedMask/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2)
'RaggedMask/boolean_mask/strided_slice_1
RaggedMask/boolean_mask/Shape_2Const*
_output_shapes
:*
dtype0*!
valueB"         2!
RaggedMask/boolean_mask/Shape_2¨
-RaggedMask/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice_2/stack¬
/RaggedMask/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_2/stack_1¬
/RaggedMask/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_2/stack_2ú
'RaggedMask/boolean_mask/strided_slice_2StridedSlice(RaggedMask/boolean_mask/Shape_2:output:06RaggedMask/boolean_mask/strided_slice_2/stack:output:08RaggedMask/boolean_mask/strided_slice_2/stack_1:output:08RaggedMask/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
:*
end_mask2)
'RaggedMask/boolean_mask/strided_slice_2¯
'RaggedMask/boolean_mask/concat/values_1Pack%RaggedMask/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2)
'RaggedMask/boolean_mask/concat/values_1
#RaggedMask/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2%
#RaggedMask/boolean_mask/concat/axis¾
RaggedMask/boolean_mask/concatConcatV20RaggedMask/boolean_mask/strided_slice_1:output:00RaggedMask/boolean_mask/concat/values_1:output:00RaggedMask/boolean_mask/strided_slice_2:output:0,RaggedMask/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2 
RaggedMask/boolean_mask/concat§
RaggedMask/boolean_mask/ReshapeReshapeinputs'RaggedMask/boolean_mask/concat:output:0*
T0*
_output_shapes

:2!
RaggedMask/boolean_mask/Reshape¥
'RaggedMask/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2)
'RaggedMask/boolean_mask/Reshape_1/shape®
!RaggedMask/boolean_mask/Reshape_1Reshapemask0RaggedMask/boolean_mask/Reshape_1/shape:output:0*
T0
*
_output_shapes
:2#
!RaggedMask/boolean_mask/Reshape_1
RaggedMask/boolean_mask/WhereWhere*RaggedMask/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/boolean_mask/Where¹
RaggedMask/boolean_mask/SqueezeSqueeze%RaggedMask/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2!
RaggedMask/boolean_mask/Squeeze
%RaggedMask/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2'
%RaggedMask/boolean_mask/GatherV2/axis©
 RaggedMask/boolean_mask/GatherV2GatherV2(RaggedMask/boolean_mask/Reshape:output:0(RaggedMask/boolean_mask/Squeeze:output:0.RaggedMask/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2"
 RaggedMask/boolean_mask/GatherV2
RaggedMask/count_nonzero/zerosConst*
_output_shapes
: *
dtype0
*
value	B
 Z 2 
RaggedMask/count_nonzero/zerosª
!RaggedMask/count_nonzero/NotEqualNotEqualmask'RaggedMask/count_nonzero/zeros:output:0*
T0
*
_output_shapes

:2#
!RaggedMask/count_nonzero/NotEqual¥
RaggedMask/count_nonzero/CastCast%RaggedMask/count_nonzero/NotEqual:z:0*

DstT0	*

SrcT0
*
_output_shapes

:2
RaggedMask/count_nonzero/Cast«
.RaggedMask/count_nonzero/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ20
.RaggedMask/count_nonzero/Sum/reduction_indicesÄ
RaggedMask/count_nonzero/SumSum!RaggedMask/count_nonzero/Cast:y:07RaggedMask/count_nonzero/Sum/reduction_indices:output:0*
T0	*
_output_shapes
:2
RaggedMask/count_nonzero/Sum
RaggedMask/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2
RaggedMask/Reshape/shape¢
RaggedMask/ReshapeReshape%RaggedMask/count_nonzero/Sum:output:0!RaggedMask/Reshape/shape:output:0*
T0	*
_output_shapes
:2
RaggedMask/ReshapeÒ
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis£
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/CumsumCumsumRaggedMask/Reshape:output:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis:output:0*
T0	*
_output_shapes
:2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsumâ
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Const*
_output_shapes
:*
dtype0	*
valueB	R 2L
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Ò
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis¯
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatConcatV2SRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0:output:0GRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum:out:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis:output:0*
N*
T0	*
_output_shapes
:2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatq
RaggedToTensor/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    2
RaggedToTensor/zerosw
RaggedToTensor/ConstConst*
_output_shapes
: *
dtype0	*
valueB	 R
ÿÿÿÿÿÿÿÿÿ2
RaggedToTensor/Const±
#RaggedToTensor/RaggedTensorToTensorRaggedTensorToTensorRaggedToTensor/Const:output:0)RaggedMask/boolean_mask/GatherV2:output:0RaggedToTensor/zeros:output:0JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0*
Tindex0	*
Tshape0	*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
num_row_partition_tensors*%
row_partition_types

ROW_SPLITS2%
#RaggedToTensor/RaggedTensorToTensor
l2_normalize/SquareSquare,RaggedToTensor/RaggedTensorToTensor:result:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
l2_normalize/Square
"l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ2$
"l2_normalize/Sum/reduction_indices¸
l2_normalize/SumSuml2_normalize/Square:y:0+l2_normalize/Sum/reduction_indices:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
	keep_dims(2
l2_normalize/Sumu
l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ì¼+2
l2_normalize/Maximum/y©
l2_normalize/MaximumMaximuml2_normalize/Sum:output:0l2_normalize/Maximum/y:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
l2_normalize/Maximum
l2_normalize/RsqrtRsqrtl2_normalize/Maximum:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
l2_normalize/Rsqrt
l2_normalizeMul,RaggedToTensor/RaggedTensorToTensor:result:0l2_normalize/Rsqrt:y:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
l2_normalizeh
IdentityIdentityl2_normalize:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*+
_input_shapes
:::J F
"
_output_shapes
:
 
_user_specified_nameinputs:D@

_output_shapes

:

_user_specified_namemask
õ/
Â
M__inference_dense_3_batch_norm_layer_call_and_return_conditional_losses_14660

inputs
assignmovingavg_14635
assignmovingavg_1_14641)
%batchnorm_mul_readvariableop_resource%
!batchnorm_readvariableop_resource
identity¢#AssignMovingAvg/AssignSubVariableOp¢AssignMovingAvg/ReadVariableOp¢%AssignMovingAvg_1/AssignSubVariableOp¢ AssignMovingAvg_1/ReadVariableOp¢batchnorm/ReadVariableOp¢batchnorm/mul/ReadVariableOp
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2 
moments/mean/reduction_indices
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(2
moments/mean|
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:@2
moments/StopGradient¤
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
moments/SquaredDifference
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2$
"moments/variance/reduction_indices²
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(2
moments/variance
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 2
moments/Squeeze
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 2
moments/Squeeze_1Ë
AssignMovingAvg/decayConst",/job:localhost/replica:0/task:0/device:CPU:0*(
_class
loc:@AssignMovingAvg/14635*
_output_shapes
: *
dtype0*
valueB
 *
×#<2
AssignMovingAvg/decay
AssignMovingAvg/ReadVariableOpReadVariableOpassignmovingavg_14635*
_output_shapes
:@*
dtype02 
AssignMovingAvg/ReadVariableOpð
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*(
_class
loc:@AssignMovingAvg/14635*
_output_shapes
:@2
AssignMovingAvg/subç
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*(
_class
loc:@AssignMovingAvg/14635*
_output_shapes
:@2
AssignMovingAvg/mul­
#AssignMovingAvg/AssignSubVariableOpAssignSubVariableOpassignmovingavg_14635AssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*(
_class
loc:@AssignMovingAvg/14635*
_output_shapes
 *
dtype02%
#AssignMovingAvg/AssignSubVariableOpÑ
AssignMovingAvg_1/decayConst",/job:localhost/replica:0/task:0/device:CPU:0**
_class 
loc:@AssignMovingAvg_1/14641*
_output_shapes
: *
dtype0*
valueB
 *
×#<2
AssignMovingAvg_1/decay
 AssignMovingAvg_1/ReadVariableOpReadVariableOpassignmovingavg_1_14641*
_output_shapes
:@*
dtype02"
 AssignMovingAvg_1/ReadVariableOpú
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0**
_class 
loc:@AssignMovingAvg_1/14641*
_output_shapes
:@2
AssignMovingAvg_1/subñ
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0**
_class 
loc:@AssignMovingAvg_1/14641*
_output_shapes
:@2
AssignMovingAvg_1/mul¹
%AssignMovingAvg_1/AssignSubVariableOpAssignSubVariableOpassignmovingavg_1_14641AssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0**
_class 
loc:@AssignMovingAvg_1/14641*
_output_shapes
 *
dtype02'
%AssignMovingAvg_1/AssignSubVariableOpg
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:2
batchnorm/add/y
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes
:@2
batchnorm/addc
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:@2
batchnorm/Rsqrt
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/mul/ReadVariableOp
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@2
batchnorm/mulv
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
batchnorm/mul_1{
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes
:@2
batchnorm/mul_2
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOp
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:@2
batchnorm/sub
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
batchnorm/add_1³
IdentityIdentitybatchnorm/add_1:z:0$^AssignMovingAvg/AssignSubVariableOp^AssignMovingAvg/ReadVariableOp&^AssignMovingAvg_1/AssignSubVariableOp!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ@::::2J
#AssignMovingAvg/AssignSubVariableOp#AssignMovingAvg/AssignSubVariableOp2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2N
%AssignMovingAvg_1/AssignSubVariableOp%AssignMovingAvg_1/AssignSubVariableOp2D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
P
<
__inference_call_14304

inputs
mask

identityt
RaggedMask/boolean_mask/ShapeShapeinputs*
T0*
_output_shapes
:2
RaggedMask/boolean_mask/Shape¤
+RaggedMask/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2-
+RaggedMask/boolean_mask/strided_slice/stack¨
-RaggedMask/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_1¨
-RaggedMask/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_2Þ
%RaggedMask/boolean_mask/strided_sliceStridedSlice&RaggedMask/boolean_mask/Shape:output:04RaggedMask/boolean_mask/strided_slice/stack:output:06RaggedMask/boolean_mask/strided_slice/stack_1:output:06RaggedMask/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2'
%RaggedMask/boolean_mask/strided_sliceª
.RaggedMask/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 20
.RaggedMask/boolean_mask/Prod/reduction_indicesÎ
RaggedMask/boolean_mask/ProdProd.RaggedMask/boolean_mask/strided_slice:output:07RaggedMask/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2
RaggedMask/boolean_mask/Prodx
RaggedMask/boolean_mask/Shape_1Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_1¨
-RaggedMask/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2/
-RaggedMask/boolean_mask/strided_slice_1/stack¬
/RaggedMask/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_1/stack_1¬
/RaggedMask/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_1/stack_2ú
'RaggedMask/boolean_mask/strided_slice_1StridedSlice(RaggedMask/boolean_mask/Shape_1:output:06RaggedMask/boolean_mask/strided_slice_1/stack:output:08RaggedMask/boolean_mask/strided_slice_1/stack_1:output:08RaggedMask/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2)
'RaggedMask/boolean_mask/strided_slice_1x
RaggedMask/boolean_mask/Shape_2Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_2¨
-RaggedMask/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice_2/stack¬
/RaggedMask/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_2/stack_1¬
/RaggedMask/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_2/stack_2ú
'RaggedMask/boolean_mask/strided_slice_2StridedSlice(RaggedMask/boolean_mask/Shape_2:output:06RaggedMask/boolean_mask/strided_slice_2/stack:output:08RaggedMask/boolean_mask/strided_slice_2/stack_1:output:08RaggedMask/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
:*
end_mask2)
'RaggedMask/boolean_mask/strided_slice_2¯
'RaggedMask/boolean_mask/concat/values_1Pack%RaggedMask/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2)
'RaggedMask/boolean_mask/concat/values_1
#RaggedMask/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2%
#RaggedMask/boolean_mask/concat/axis¾
RaggedMask/boolean_mask/concatConcatV20RaggedMask/boolean_mask/strided_slice_1:output:00RaggedMask/boolean_mask/concat/values_1:output:00RaggedMask/boolean_mask/strided_slice_2:output:0,RaggedMask/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2 
RaggedMask/boolean_mask/concat°
RaggedMask/boolean_mask/ReshapeReshapeinputs'RaggedMask/boolean_mask/concat:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2!
RaggedMask/boolean_mask/Reshape¥
'RaggedMask/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2)
'RaggedMask/boolean_mask/Reshape_1/shape·
!RaggedMask/boolean_mask/Reshape_1Reshapemask0RaggedMask/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/boolean_mask/Reshape_1
RaggedMask/boolean_mask/WhereWhere*RaggedMask/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/boolean_mask/Where¹
RaggedMask/boolean_mask/SqueezeSqueeze%RaggedMask/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2!
RaggedMask/boolean_mask/Squeeze
%RaggedMask/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2'
%RaggedMask/boolean_mask/GatherV2/axis©
 RaggedMask/boolean_mask/GatherV2GatherV2(RaggedMask/boolean_mask/Reshape:output:0(RaggedMask/boolean_mask/Squeeze:output:0.RaggedMask/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2"
 RaggedMask/boolean_mask/GatherV2
RaggedMask/count_nonzero/zerosConst*
_output_shapes
: *
dtype0
*
value	B
 Z 2 
RaggedMask/count_nonzero/zeros¼
!RaggedMask/count_nonzero/NotEqualNotEqualmask'RaggedMask/count_nonzero/zeros:output:0*
T0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/count_nonzero/NotEqual·
RaggedMask/count_nonzero/CastCast%RaggedMask/count_nonzero/NotEqual:z:0*

DstT0	*

SrcT0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Cast«
.RaggedMask/count_nonzero/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ20
.RaggedMask/count_nonzero/Sum/reduction_indicesÍ
RaggedMask/count_nonzero/SumSum!RaggedMask/count_nonzero/Cast:y:07RaggedMask/count_nonzero/Sum/reduction_indices:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Sum
RaggedMask/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2
RaggedMask/Reshape/shape«
RaggedMask/ReshapeReshape%RaggedMask/count_nonzero/Sum:output:0!RaggedMask/Reshape/shape:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/ReshapeÒ
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis¬
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/CumsumCumsumRaggedMask/Reshape:output:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsumâ
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Const*
_output_shapes
:*
dtype0	*
valueB	R 2L
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Ò
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis¸
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatConcatV2SRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0:output:0GRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum:out:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis:output:0*
N*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatq
RaggedToTensor/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    2
RaggedToTensor/zerosw
RaggedToTensor/ConstConst*
_output_shapes
: *
dtype0	*
valueB	 R
ÿÿÿÿÿÿÿÿÿ2
RaggedToTensor/Constº
#RaggedToTensor/RaggedTensorToTensorRaggedTensorToTensorRaggedToTensor/Const:output:0)RaggedMask/boolean_mask/GatherV2:output:0RaggedToTensor/zeros:output:0JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0*
Tindex0	*
Tshape0	*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
num_row_partition_tensors*%
row_partition_types

ROW_SPLITS2%
#RaggedToTensor/RaggedTensorToTensor¡
l2_normalize/SquareSquare,RaggedToTensor/RaggedTensorToTensor:result:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalize/Square
"l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ2$
"l2_normalize/Sum/reduction_indicesÁ
l2_normalize/SumSuml2_normalize/Square:y:0+l2_normalize/Sum/reduction_indices:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
	keep_dims(2
l2_normalize/Sumu
l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ì¼+2
l2_normalize/Maximum/y²
l2_normalize/MaximumMaximuml2_normalize/Sum:output:0l2_normalize/Maximum/y:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalize/Maximum
l2_normalize/RsqrtRsqrtl2_normalize/Maximum:z:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalize/Rsqrt¨
l2_normalizeMul,RaggedToTensor/RaggedTensorToTensor:result:0l2_normalize/Rsqrt:y:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalizeq
IdentityIdentityl2_normalize:z:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*O
_input_shapes>
<:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:\ X
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:VR
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

_user_specified_namemask
²
p
F__inference_concatenate_layer_call_and_return_conditional_losses_15046

inputs
inputs_1
identity\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis
concatConcatV2inputsinputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 2
concatc
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 2

Identity"
identityIdentity:output:0*9
_input_shapes(
&:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:OK
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
µ
c
G__inference_dense_3_relu_layer_call_and_return_conditional_losses_16609

inputs
identityN
ReluReluinputs*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
Reluf
IdentityIdentityRelu:activations:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*&
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
òÀ
á
!__inference__traced_restore_17020
file_prefix3
/assignvariableop_searched_embeddings_embeddings4
0assignvariableop_1_watched_embeddings_embeddings%
!assignvariableop_2_dense_1_kernel#
assignvariableop_3_dense_1_bias%
!assignvariableop_4_dense_2_kernel#
assignvariableop_5_dense_2_bias%
!assignvariableop_6_dense_3_kernel#
assignvariableop_7_dense_3_bias/
+assignvariableop_8_dense_3_batch_norm_gamma.
*assignvariableop_9_dense_3_batch_norm_beta6
2assignvariableop_10_dense_3_batch_norm_moving_mean:
6assignvariableop_11_dense_3_batch_norm_moving_variance+
'assignvariableop_12_dense_output_kernel)
%assignvariableop_13_dense_output_bias!
assignvariableop_14_adam_iter#
assignvariableop_15_adam_beta_1#
assignvariableop_16_adam_beta_2"
assignvariableop_17_adam_decay*
&assignvariableop_18_adam_learning_rate
assignvariableop_19_total
assignvariableop_20_count=
9assignvariableop_21_adam_searched_embeddings_embeddings_m<
8assignvariableop_22_adam_watched_embeddings_embeddings_m-
)assignvariableop_23_adam_dense_1_kernel_m+
'assignvariableop_24_adam_dense_1_bias_m-
)assignvariableop_25_adam_dense_2_kernel_m+
'assignvariableop_26_adam_dense_2_bias_m-
)assignvariableop_27_adam_dense_3_kernel_m+
'assignvariableop_28_adam_dense_3_bias_m7
3assignvariableop_29_adam_dense_3_batch_norm_gamma_m6
2assignvariableop_30_adam_dense_3_batch_norm_beta_m2
.assignvariableop_31_adam_dense_output_kernel_m0
,assignvariableop_32_adam_dense_output_bias_m=
9assignvariableop_33_adam_searched_embeddings_embeddings_v<
8assignvariableop_34_adam_watched_embeddings_embeddings_v-
)assignvariableop_35_adam_dense_1_kernel_v+
'assignvariableop_36_adam_dense_1_bias_v-
)assignvariableop_37_adam_dense_2_kernel_v+
'assignvariableop_38_adam_dense_2_bias_v-
)assignvariableop_39_adam_dense_3_kernel_v+
'assignvariableop_40_adam_dense_3_bias_v7
3assignvariableop_41_adam_dense_3_batch_norm_gamma_v6
2assignvariableop_42_adam_dense_3_batch_norm_beta_v2
.assignvariableop_43_adam_dense_output_kernel_v0
,assignvariableop_44_adam_dense_output_bias_v
identity_46¢AssignVariableOp¢AssignVariableOp_1¢AssignVariableOp_10¢AssignVariableOp_11¢AssignVariableOp_12¢AssignVariableOp_13¢AssignVariableOp_14¢AssignVariableOp_15¢AssignVariableOp_16¢AssignVariableOp_17¢AssignVariableOp_18¢AssignVariableOp_19¢AssignVariableOp_2¢AssignVariableOp_20¢AssignVariableOp_21¢AssignVariableOp_22¢AssignVariableOp_23¢AssignVariableOp_24¢AssignVariableOp_25¢AssignVariableOp_26¢AssignVariableOp_27¢AssignVariableOp_28¢AssignVariableOp_29¢AssignVariableOp_3¢AssignVariableOp_30¢AssignVariableOp_31¢AssignVariableOp_32¢AssignVariableOp_33¢AssignVariableOp_34¢AssignVariableOp_35¢AssignVariableOp_36¢AssignVariableOp_37¢AssignVariableOp_38¢AssignVariableOp_39¢AssignVariableOp_4¢AssignVariableOp_40¢AssignVariableOp_41¢AssignVariableOp_42¢AssignVariableOp_43¢AssignVariableOp_44¢AssignVariableOp_5¢AssignVariableOp_6¢AssignVariableOp_7¢AssignVariableOp_8¢AssignVariableOp_9í
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*ù
valueïBì.B:layer_with_weights-0/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-1/embeddings/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB5layer_with_weights-5/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/beta/.ATTRIBUTES/VARIABLE_VALUEB;layer_with_weights-5/moving_mean/.ATTRIBUTES/VARIABLE_VALUEB?layer_with_weights-5/moving_variance/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-5/gamma/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBQlayer_with_weights-5/gamma/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/beta/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_namesê
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:.*
dtype0*o
valuefBd.B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slices
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*Î
_output_shapes»
¸::::::::::::::::::::::::::::::::::::::::::::::*<
dtypes2
02.	2
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

Identity®
AssignVariableOpAssignVariableOp/assignvariableop_searched_embeddings_embeddingsIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1µ
AssignVariableOp_1AssignVariableOp0assignvariableop_1_watched_embeddings_embeddingsIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2¦
AssignVariableOp_2AssignVariableOp!assignvariableop_2_dense_1_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3¤
AssignVariableOp_3AssignVariableOpassignvariableop_3_dense_1_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4¦
AssignVariableOp_4AssignVariableOp!assignvariableop_4_dense_2_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5¤
AssignVariableOp_5AssignVariableOpassignvariableop_5_dense_2_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:2

Identity_6¦
AssignVariableOp_6AssignVariableOp!assignvariableop_6_dense_3_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7¤
AssignVariableOp_7AssignVariableOpassignvariableop_7_dense_3_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8°
AssignVariableOp_8AssignVariableOp+assignvariableop_8_dense_3_batch_norm_gammaIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9¯
AssignVariableOp_9AssignVariableOp*assignvariableop_9_dense_3_batch_norm_betaIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10º
AssignVariableOp_10AssignVariableOp2assignvariableop_10_dense_3_batch_norm_moving_meanIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11¾
AssignVariableOp_11AssignVariableOp6assignvariableop_11_dense_3_batch_norm_moving_varianceIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_11n
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:2
Identity_12¯
AssignVariableOp_12AssignVariableOp'assignvariableop_12_dense_output_kernelIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_12n
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:2
Identity_13­
AssignVariableOp_13AssignVariableOp%assignvariableop_13_dense_output_biasIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_13n
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0	*
_output_shapes
:2
Identity_14¥
AssignVariableOp_14AssignVariableOpassignvariableop_14_adam_iterIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_14n
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:2
Identity_15§
AssignVariableOp_15AssignVariableOpassignvariableop_15_adam_beta_1Identity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_15n
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:2
Identity_16§
AssignVariableOp_16AssignVariableOpassignvariableop_16_adam_beta_2Identity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_16n
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:2
Identity_17¦
AssignVariableOp_17AssignVariableOpassignvariableop_17_adam_decayIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_17n
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:2
Identity_18®
AssignVariableOp_18AssignVariableOp&assignvariableop_18_adam_learning_rateIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_18n
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:2
Identity_19¡
AssignVariableOp_19AssignVariableOpassignvariableop_19_totalIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_19n
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:2
Identity_20¡
AssignVariableOp_20AssignVariableOpassignvariableop_20_countIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_20n
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:2
Identity_21Á
AssignVariableOp_21AssignVariableOp9assignvariableop_21_adam_searched_embeddings_embeddings_mIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_21n
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:2
Identity_22À
AssignVariableOp_22AssignVariableOp8assignvariableop_22_adam_watched_embeddings_embeddings_mIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_22n
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:2
Identity_23±
AssignVariableOp_23AssignVariableOp)assignvariableop_23_adam_dense_1_kernel_mIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_23n
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:2
Identity_24¯
AssignVariableOp_24AssignVariableOp'assignvariableop_24_adam_dense_1_bias_mIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_24n
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:2
Identity_25±
AssignVariableOp_25AssignVariableOp)assignvariableop_25_adam_dense_2_kernel_mIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_25n
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:2
Identity_26¯
AssignVariableOp_26AssignVariableOp'assignvariableop_26_adam_dense_2_bias_mIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_26n
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:2
Identity_27±
AssignVariableOp_27AssignVariableOp)assignvariableop_27_adam_dense_3_kernel_mIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_27n
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:2
Identity_28¯
AssignVariableOp_28AssignVariableOp'assignvariableop_28_adam_dense_3_bias_mIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_28n
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:2
Identity_29»
AssignVariableOp_29AssignVariableOp3assignvariableop_29_adam_dense_3_batch_norm_gamma_mIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_29n
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:2
Identity_30º
AssignVariableOp_30AssignVariableOp2assignvariableop_30_adam_dense_3_batch_norm_beta_mIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_30n
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:2
Identity_31¶
AssignVariableOp_31AssignVariableOp.assignvariableop_31_adam_dense_output_kernel_mIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_31n
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:2
Identity_32´
AssignVariableOp_32AssignVariableOp,assignvariableop_32_adam_dense_output_bias_mIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_32n
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:2
Identity_33Á
AssignVariableOp_33AssignVariableOp9assignvariableop_33_adam_searched_embeddings_embeddings_vIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_33n
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:2
Identity_34À
AssignVariableOp_34AssignVariableOp8assignvariableop_34_adam_watched_embeddings_embeddings_vIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_34n
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:2
Identity_35±
AssignVariableOp_35AssignVariableOp)assignvariableop_35_adam_dense_1_kernel_vIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_35n
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:2
Identity_36¯
AssignVariableOp_36AssignVariableOp'assignvariableop_36_adam_dense_1_bias_vIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_36n
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:2
Identity_37±
AssignVariableOp_37AssignVariableOp)assignvariableop_37_adam_dense_2_kernel_vIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_37n
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:2
Identity_38¯
AssignVariableOp_38AssignVariableOp'assignvariableop_38_adam_dense_2_bias_vIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_38n
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:2
Identity_39±
AssignVariableOp_39AssignVariableOp)assignvariableop_39_adam_dense_3_kernel_vIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_39n
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:2
Identity_40¯
AssignVariableOp_40AssignVariableOp'assignvariableop_40_adam_dense_3_bias_vIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_40n
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:2
Identity_41»
AssignVariableOp_41AssignVariableOp3assignvariableop_41_adam_dense_3_batch_norm_gamma_vIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_41n
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:2
Identity_42º
AssignVariableOp_42AssignVariableOp2assignvariableop_42_adam_dense_3_batch_norm_beta_vIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_42n
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:2
Identity_43¶
AssignVariableOp_43AssignVariableOp.assignvariableop_43_adam_dense_output_kernel_vIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_43n
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:2
Identity_44´
AssignVariableOp_44AssignVariableOp,assignvariableop_44_adam_dense_output_bias_vIdentity_44:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_449
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp¼
Identity_45Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_45¯
Identity_46IdentityIdentity_45:output:0^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*
T0*
_output_shapes
: 2
Identity_46"#
identity_46Identity_46:output:0*Ë
_input_shapes¹
¶: :::::::::::::::::::::::::::::::::::::::::::::2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
»
r
F__inference_concatenate_layer_call_and_return_conditional_losses_16521
inputs_0
inputs_1
identity\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis
concatConcatV2inputs_0inputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 2
concatc
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 2

Identity"
identityIdentity:output:0*9
_input_shapes(
&:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:Q M
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/1
	
Û
B__inference_dense_3_layer_call_and_return_conditional_losses_16595

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@@*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
MatMul
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
BiasAdd/ReadVariableOp
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2	
BiasAdd
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
ÿ	
à
G__inference_dense_output_layer_call_and_return_conditional_losses_16707

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@¬*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2
MatMul
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:¬*
dtype02
BiasAdd/ReadVariableOp
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2	
BiasAddb
SoftmaxSoftmaxBiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2	
Softmax
IdentityIdentitySoftmax:softmax:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2

Identity"
identityIdentity:output:0*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
ãk
Ç

@__inference_model_layer_call_and_return_conditional_losses_15662
inputs_0
inputs_1-
)watched_embeddings_embedding_lookup_15596.
*searched_embeddings_embedding_lookup_15604*
&dense_1_matmul_readvariableop_resource+
'dense_1_biasadd_readvariableop_resource*
&dense_2_matmul_readvariableop_resource+
'dense_2_biasadd_readvariableop_resource*
&dense_3_matmul_readvariableop_resource+
'dense_3_biasadd_readvariableop_resource8
4dense_3_batch_norm_batchnorm_readvariableop_resource<
8dense_3_batch_norm_batchnorm_mul_readvariableop_resource:
6dense_3_batch_norm_batchnorm_readvariableop_1_resource:
6dense_3_batch_norm_batchnorm_readvariableop_2_resource/
+dense_output_matmul_readvariableop_resource0
,dense_output_biasadd_readvariableop_resource
identity¢dense_1/BiasAdd/ReadVariableOp¢dense_1/MatMul/ReadVariableOp¢dense_2/BiasAdd/ReadVariableOp¢dense_2/MatMul/ReadVariableOp¢dense_3/BiasAdd/ReadVariableOp¢dense_3/MatMul/ReadVariableOp¢+dense_3_batch_norm/batchnorm/ReadVariableOp¢-dense_3_batch_norm/batchnorm/ReadVariableOp_1¢-dense_3_batch_norm/batchnorm/ReadVariableOp_2¢/dense_3_batch_norm/batchnorm/mul/ReadVariableOp¢#dense_output/BiasAdd/ReadVariableOp¢"dense_output/MatMul/ReadVariableOp¢$searched_embeddings/embedding_lookup¢#watched_embeddings/embedding_lookup
watched_embeddings/CastCastinputs_1*

DstT0*

SrcT0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
watched_embeddings/Castã
#watched_embeddings/embedding_lookupResourceGather)watched_embeddings_embedding_lookup_15596watched_embeddings/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*<
_class2
0.loc:@watched_embeddings/embedding_lookup/15596*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
dtype02%
#watched_embeddings/embedding_lookupÁ
,watched_embeddings/embedding_lookup/IdentityIdentity,watched_embeddings/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*<
_class2
0.loc:@watched_embeddings/embedding_lookup/15596*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2.
,watched_embeddings/embedding_lookup/Identityâ
.watched_embeddings/embedding_lookup/Identity_1Identity5watched_embeddings/embedding_lookup/Identity:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ20
.watched_embeddings/embedding_lookup/Identity_1
watched_embeddings/NotEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
watched_embeddings/NotEqual/y³
watched_embeddings/NotEqualNotEqualinputs_1&watched_embeddings/NotEqual/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
watched_embeddings/NotEqual
searched_embeddings/CastCastinputs_0*

DstT0*

SrcT0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
searched_embeddings/Castè
$searched_embeddings/embedding_lookupResourceGather*searched_embeddings_embedding_lookup_15604searched_embeddings/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*=
_class3
1/loc:@searched_embeddings/embedding_lookup/15604*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
dtype02&
$searched_embeddings/embedding_lookupÅ
-searched_embeddings/embedding_lookup/IdentityIdentity-searched_embeddings/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*=
_class3
1/loc:@searched_embeddings/embedding_lookup/15604*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2/
-searched_embeddings/embedding_lookup/Identityå
/searched_embeddings/embedding_lookup/Identity_1Identity6searched_embeddings/embedding_lookup/Identity:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ21
/searched_embeddings/embedding_lookup/Identity_1
searched_embeddings/NotEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2 
searched_embeddings/NotEqual/y¶
searched_embeddings/NotEqualNotEqualinputs_0'searched_embeddings/NotEqual/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
searched_embeddings/NotEqual
l2_norm_1/PartitionedCallPartitionedCall7watched_embeddings/embedding_lookup/Identity_1:output:0watched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *
fR
__inference_call_143042
l2_norm_1/PartitionedCall
l2_norm_1/PartitionedCall_1PartitionedCall8searched_embeddings/embedding_lookup/Identity_1:output:0 searched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *
fR
__inference_call_143042
l2_norm_1/PartitionedCall_1ÿ
$aggregate_embeddings/PartitionedCallPartitionedCall$l2_norm_1/PartitionedCall_1:output:0 searched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *
fR
__inference_call_145142&
$aggregate_embeddings/PartitionedCall
&aggregate_embeddings/PartitionedCall_1PartitionedCall"l2_norm_1/PartitionedCall:output:0watched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *
fR
__inference_call_145142(
&aggregate_embeddings/PartitionedCall_1t
concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concatenate/concat/axisñ
concatenate/concatConcatV2-aggregate_embeddings/PartitionedCall:output:0/aggregate_embeddings/PartitionedCall_1:output:0 concatenate/concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 2
concatenate/concat¥
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource*
_output_shapes

: @*
dtype02
dense_1/MatMul/ReadVariableOp 
dense_1/MatMulMatMulconcatenate/concat:output:0%dense_1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_1/MatMul¤
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02 
dense_1/BiasAdd/ReadVariableOp¡
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_1/BiasAddz
dense_1_relu/ReluReludense_1/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_1_relu/Relu¥
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource*
_output_shapes

:@@*
dtype02
dense_2/MatMul/ReadVariableOp¤
dense_2/MatMulMatMuldense_1_relu/Relu:activations:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_2/MatMul¤
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02 
dense_2/BiasAdd/ReadVariableOp¡
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_2/BiasAddz
dense_2_relu/ReluReludense_2/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_2_relu/Relu¥
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource*
_output_shapes

:@@*
dtype02
dense_3/MatMul/ReadVariableOp¤
dense_3/MatMulMatMuldense_2_relu/Relu:activations:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_3/MatMul¤
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02 
dense_3/BiasAdd/ReadVariableOp¡
dense_3/BiasAddBiasAdddense_3/MatMul:product:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_3/BiasAddz
dense_3_relu/ReluReludense_3/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_3_relu/ReluË
+dense_3_batch_norm/batchnorm/ReadVariableOpReadVariableOp4dense_3_batch_norm_batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype02-
+dense_3_batch_norm/batchnorm/ReadVariableOp
"dense_3_batch_norm/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:2$
"dense_3_batch_norm/batchnorm/add/yÔ
 dense_3_batch_norm/batchnorm/addAddV23dense_3_batch_norm/batchnorm/ReadVariableOp:value:0+dense_3_batch_norm/batchnorm/add/y:output:0*
T0*
_output_shapes
:@2"
 dense_3_batch_norm/batchnorm/add
"dense_3_batch_norm/batchnorm/RsqrtRsqrt$dense_3_batch_norm/batchnorm/add:z:0*
T0*
_output_shapes
:@2$
"dense_3_batch_norm/batchnorm/Rsqrt×
/dense_3_batch_norm/batchnorm/mul/ReadVariableOpReadVariableOp8dense_3_batch_norm_batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype021
/dense_3_batch_norm/batchnorm/mul/ReadVariableOpÑ
 dense_3_batch_norm/batchnorm/mulMul&dense_3_batch_norm/batchnorm/Rsqrt:y:07dense_3_batch_norm/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@2"
 dense_3_batch_norm/batchnorm/mulÈ
"dense_3_batch_norm/batchnorm/mul_1Muldense_3_relu/Relu:activations:0$dense_3_batch_norm/batchnorm/mul:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2$
"dense_3_batch_norm/batchnorm/mul_1Ñ
-dense_3_batch_norm/batchnorm/ReadVariableOp_1ReadVariableOp6dense_3_batch_norm_batchnorm_readvariableop_1_resource*
_output_shapes
:@*
dtype02/
-dense_3_batch_norm/batchnorm/ReadVariableOp_1Ñ
"dense_3_batch_norm/batchnorm/mul_2Mul5dense_3_batch_norm/batchnorm/ReadVariableOp_1:value:0$dense_3_batch_norm/batchnorm/mul:z:0*
T0*
_output_shapes
:@2$
"dense_3_batch_norm/batchnorm/mul_2Ñ
-dense_3_batch_norm/batchnorm/ReadVariableOp_2ReadVariableOp6dense_3_batch_norm_batchnorm_readvariableop_2_resource*
_output_shapes
:@*
dtype02/
-dense_3_batch_norm/batchnorm/ReadVariableOp_2Ï
 dense_3_batch_norm/batchnorm/subSub5dense_3_batch_norm/batchnorm/ReadVariableOp_2:value:0&dense_3_batch_norm/batchnorm/mul_2:z:0*
T0*
_output_shapes
:@2"
 dense_3_batch_norm/batchnorm/subÑ
"dense_3_batch_norm/batchnorm/add_1AddV2&dense_3_batch_norm/batchnorm/mul_1:z:0$dense_3_batch_norm/batchnorm/sub:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2$
"dense_3_batch_norm/batchnorm/add_1µ
"dense_output/MatMul/ReadVariableOpReadVariableOp+dense_output_matmul_readvariableop_resource*
_output_shapes
:	@¬*
dtype02$
"dense_output/MatMul/ReadVariableOp»
dense_output/MatMulMatMul&dense_3_batch_norm/batchnorm/add_1:z:0*dense_output/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2
dense_output/MatMul´
#dense_output/BiasAdd/ReadVariableOpReadVariableOp,dense_output_biasadd_readvariableop_resource*
_output_shapes	
:¬*
dtype02%
#dense_output/BiasAdd/ReadVariableOp¶
dense_output/BiasAddBiasAdddense_output/MatMul:product:0+dense_output/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2
dense_output/BiasAdd
dense_output/SoftmaxSoftmaxdense_output/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2
dense_output/Softmax
IdentityIdentitydense_output/Softmax:softmax:0^dense_1/BiasAdd/ReadVariableOp^dense_1/MatMul/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp^dense_3/MatMul/ReadVariableOp,^dense_3_batch_norm/batchnorm/ReadVariableOp.^dense_3_batch_norm/batchnorm/ReadVariableOp_1.^dense_3_batch_norm/batchnorm/ReadVariableOp_20^dense_3_batch_norm/batchnorm/mul/ReadVariableOp$^dense_output/BiasAdd/ReadVariableOp#^dense_output/MatMul/ReadVariableOp%^searched_embeddings/embedding_lookup$^watched_embeddings/embedding_lookup*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2

Identity"
identityIdentity:output:0*
_input_shapesr
p:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ::::::::::::::2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp2Z
+dense_3_batch_norm/batchnorm/ReadVariableOp+dense_3_batch_norm/batchnorm/ReadVariableOp2^
-dense_3_batch_norm/batchnorm/ReadVariableOp_1-dense_3_batch_norm/batchnorm/ReadVariableOp_12^
-dense_3_batch_norm/batchnorm/ReadVariableOp_2-dense_3_batch_norm/batchnorm/ReadVariableOp_22b
/dense_3_batch_norm/batchnorm/mul/ReadVariableOp/dense_3_batch_norm/batchnorm/mul/ReadVariableOp2J
#dense_output/BiasAdd/ReadVariableOp#dense_output/BiasAdd/ReadVariableOp2H
"dense_output/MatMul/ReadVariableOp"dense_output/MatMul/ReadVariableOp2L
$searched_embeddings/embedding_lookup$searched_embeddings/embedding_lookup2J
#watched_embeddings/embedding_lookup#watched_embeddings/embedding_lookup:Z V
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/0:ZV
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/1
µ
c
G__inference_dense_1_relu_layer_call_and_return_conditional_losses_16551

inputs
identityN
ReluReluinputs*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
Reluf
IdentityIdentityRelu:activations:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*&
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs

È
#__inference_signature_wrapper_15504
search_query
watch_history
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
	unknown_8
	unknown_9

unknown_10

unknown_11

unknown_12
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallsearch_querywatch_historyunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8 *)
f$R"
 __inference__wrapped_model_145642
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2

Identity"
identityIdentity:output:0*
_input_shapesr
p:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ::::::::::::::22
StatefulPartitionedCallStatefulPartitionedCall:^ Z
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
&
_user_specified_namesearch_query:_[
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
'
_user_specified_namewatch_history
Ç
Z
4__inference_aggregate_embeddings_layer_call_fn_16146

inputs
mask

identityÔ
PartitionedCallPartitionedCallinputsmask*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_aggregate_embeddings_layer_call_and_return_conditional_losses_150292
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*O
_input_shapes>
<:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:\ X
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:VR
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

_user_specified_namemask
ú
x
2__inference_watched_embeddings_layer_call_fn_15764

inputs
unknown
identity¢StatefulPartitionedCallý
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_watched_embeddings_layer_call_and_return_conditional_losses_147192
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*3
_input_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ÀP
j
D__inference_l2_norm_1_layer_call_and_return_conditional_losses_15818

inputs
mask

identityt
RaggedMask/boolean_mask/ShapeShapeinputs*
T0*
_output_shapes
:2
RaggedMask/boolean_mask/Shape¤
+RaggedMask/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2-
+RaggedMask/boolean_mask/strided_slice/stack¨
-RaggedMask/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_1¨
-RaggedMask/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_2Þ
%RaggedMask/boolean_mask/strided_sliceStridedSlice&RaggedMask/boolean_mask/Shape:output:04RaggedMask/boolean_mask/strided_slice/stack:output:06RaggedMask/boolean_mask/strided_slice/stack_1:output:06RaggedMask/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2'
%RaggedMask/boolean_mask/strided_sliceª
.RaggedMask/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 20
.RaggedMask/boolean_mask/Prod/reduction_indicesÎ
RaggedMask/boolean_mask/ProdProd.RaggedMask/boolean_mask/strided_slice:output:07RaggedMask/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2
RaggedMask/boolean_mask/Prodx
RaggedMask/boolean_mask/Shape_1Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_1¨
-RaggedMask/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2/
-RaggedMask/boolean_mask/strided_slice_1/stack¬
/RaggedMask/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_1/stack_1¬
/RaggedMask/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_1/stack_2ú
'RaggedMask/boolean_mask/strided_slice_1StridedSlice(RaggedMask/boolean_mask/Shape_1:output:06RaggedMask/boolean_mask/strided_slice_1/stack:output:08RaggedMask/boolean_mask/strided_slice_1/stack_1:output:08RaggedMask/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2)
'RaggedMask/boolean_mask/strided_slice_1x
RaggedMask/boolean_mask/Shape_2Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_2¨
-RaggedMask/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice_2/stack¬
/RaggedMask/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_2/stack_1¬
/RaggedMask/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_2/stack_2ú
'RaggedMask/boolean_mask/strided_slice_2StridedSlice(RaggedMask/boolean_mask/Shape_2:output:06RaggedMask/boolean_mask/strided_slice_2/stack:output:08RaggedMask/boolean_mask/strided_slice_2/stack_1:output:08RaggedMask/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
:*
end_mask2)
'RaggedMask/boolean_mask/strided_slice_2¯
'RaggedMask/boolean_mask/concat/values_1Pack%RaggedMask/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2)
'RaggedMask/boolean_mask/concat/values_1
#RaggedMask/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2%
#RaggedMask/boolean_mask/concat/axis¾
RaggedMask/boolean_mask/concatConcatV20RaggedMask/boolean_mask/strided_slice_1:output:00RaggedMask/boolean_mask/concat/values_1:output:00RaggedMask/boolean_mask/strided_slice_2:output:0,RaggedMask/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2 
RaggedMask/boolean_mask/concat°
RaggedMask/boolean_mask/ReshapeReshapeinputs'RaggedMask/boolean_mask/concat:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2!
RaggedMask/boolean_mask/Reshape¥
'RaggedMask/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2)
'RaggedMask/boolean_mask/Reshape_1/shape·
!RaggedMask/boolean_mask/Reshape_1Reshapemask0RaggedMask/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/boolean_mask/Reshape_1
RaggedMask/boolean_mask/WhereWhere*RaggedMask/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/boolean_mask/Where¹
RaggedMask/boolean_mask/SqueezeSqueeze%RaggedMask/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2!
RaggedMask/boolean_mask/Squeeze
%RaggedMask/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2'
%RaggedMask/boolean_mask/GatherV2/axis©
 RaggedMask/boolean_mask/GatherV2GatherV2(RaggedMask/boolean_mask/Reshape:output:0(RaggedMask/boolean_mask/Squeeze:output:0.RaggedMask/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2"
 RaggedMask/boolean_mask/GatherV2
RaggedMask/count_nonzero/zerosConst*
_output_shapes
: *
dtype0
*
value	B
 Z 2 
RaggedMask/count_nonzero/zeros¼
!RaggedMask/count_nonzero/NotEqualNotEqualmask'RaggedMask/count_nonzero/zeros:output:0*
T0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/count_nonzero/NotEqual·
RaggedMask/count_nonzero/CastCast%RaggedMask/count_nonzero/NotEqual:z:0*

DstT0	*

SrcT0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Cast«
.RaggedMask/count_nonzero/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ20
.RaggedMask/count_nonzero/Sum/reduction_indicesÍ
RaggedMask/count_nonzero/SumSum!RaggedMask/count_nonzero/Cast:y:07RaggedMask/count_nonzero/Sum/reduction_indices:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Sum
RaggedMask/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2
RaggedMask/Reshape/shape«
RaggedMask/ReshapeReshape%RaggedMask/count_nonzero/Sum:output:0!RaggedMask/Reshape/shape:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/ReshapeÒ
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis¬
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/CumsumCumsumRaggedMask/Reshape:output:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsumâ
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Const*
_output_shapes
:*
dtype0	*
valueB	R 2L
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Ò
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis¸
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatConcatV2SRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0:output:0GRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum:out:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis:output:0*
N*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatq
RaggedToTensor/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    2
RaggedToTensor/zerosw
RaggedToTensor/ConstConst*
_output_shapes
: *
dtype0	*
valueB	 R
ÿÿÿÿÿÿÿÿÿ2
RaggedToTensor/Constº
#RaggedToTensor/RaggedTensorToTensorRaggedTensorToTensorRaggedToTensor/Const:output:0)RaggedMask/boolean_mask/GatherV2:output:0RaggedToTensor/zeros:output:0JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0*
Tindex0	*
Tshape0	*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
num_row_partition_tensors*%
row_partition_types

ROW_SPLITS2%
#RaggedToTensor/RaggedTensorToTensor¡
l2_normalize/SquareSquare,RaggedToTensor/RaggedTensorToTensor:result:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalize/Square
"l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ2$
"l2_normalize/Sum/reduction_indicesÁ
l2_normalize/SumSuml2_normalize/Square:y:0+l2_normalize/Sum/reduction_indices:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
	keep_dims(2
l2_normalize/Sumu
l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ì¼+2
l2_normalize/Maximum/y²
l2_normalize/MaximumMaximuml2_normalize/Sum:output:0l2_normalize/Maximum/y:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalize/Maximum
l2_normalize/RsqrtRsqrtl2_normalize/Maximum:z:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalize/Rsqrt¨
l2_normalizeMul,RaggedToTensor/RaggedTensorToTensor:result:0l2_normalize/Rsqrt:y:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalizeq
IdentityIdentityl2_normalize:z:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*O
_input_shapes>
<:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:\ X
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:VR
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

_user_specified_namemask
¢
Ê
%__inference_model_layer_call_fn_15460
search_query
watch_history
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
	unknown_8
	unknown_9

unknown_10

unknown_11

unknown_12
identity¢StatefulPartitionedCall¦
StatefulPartitionedCallStatefulPartitionedCallsearch_querywatch_historyunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8 *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_154292
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2

Identity"
identityIdentity:output:0*
_input_shapesr
p:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ::::::::::::::22
StatefulPartitionedCallStatefulPartitionedCall:^ Z
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
&
_user_specified_namesearch_query:_[
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
'
_user_specified_namewatch_history
 
Ê
%__inference_model_layer_call_fn_15374
search_query
watch_history
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
	unknown_8
	unknown_9

unknown_10

unknown_11

unknown_12
identity¢StatefulPartitionedCall¤
StatefulPartitionedCallStatefulPartitionedCallsearch_querywatch_historyunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*.
_read_only_resource_inputs
	*-
config_proto

CPU

GPU 2J 8 *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_153432
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2

Identity"
identityIdentity:output:0*
_input_shapesr
p:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ::::::::::::::22
StatefulPartitionedCallStatefulPartitionedCall:^ Z
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
&
_user_specified_namesearch_query:_[
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
'
_user_specified_namewatch_history
§ç
<
__inference_call_14514

inputs
mask

identityt
RaggedMask/boolean_mask/ShapeShapeinputs*
T0*
_output_shapes
:2
RaggedMask/boolean_mask/Shape¤
+RaggedMask/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2-
+RaggedMask/boolean_mask/strided_slice/stack¨
-RaggedMask/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_1¨
-RaggedMask/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_2Þ
%RaggedMask/boolean_mask/strided_sliceStridedSlice&RaggedMask/boolean_mask/Shape:output:04RaggedMask/boolean_mask/strided_slice/stack:output:06RaggedMask/boolean_mask/strided_slice/stack_1:output:06RaggedMask/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2'
%RaggedMask/boolean_mask/strided_sliceª
.RaggedMask/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 20
.RaggedMask/boolean_mask/Prod/reduction_indicesÎ
RaggedMask/boolean_mask/ProdProd.RaggedMask/boolean_mask/strided_slice:output:07RaggedMask/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2
RaggedMask/boolean_mask/Prodx
RaggedMask/boolean_mask/Shape_1Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_1¨
-RaggedMask/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2/
-RaggedMask/boolean_mask/strided_slice_1/stack¬
/RaggedMask/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_1/stack_1¬
/RaggedMask/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_1/stack_2ú
'RaggedMask/boolean_mask/strided_slice_1StridedSlice(RaggedMask/boolean_mask/Shape_1:output:06RaggedMask/boolean_mask/strided_slice_1/stack:output:08RaggedMask/boolean_mask/strided_slice_1/stack_1:output:08RaggedMask/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2)
'RaggedMask/boolean_mask/strided_slice_1x
RaggedMask/boolean_mask/Shape_2Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_2¨
-RaggedMask/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice_2/stack¬
/RaggedMask/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_2/stack_1¬
/RaggedMask/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_2/stack_2ú
'RaggedMask/boolean_mask/strided_slice_2StridedSlice(RaggedMask/boolean_mask/Shape_2:output:06RaggedMask/boolean_mask/strided_slice_2/stack:output:08RaggedMask/boolean_mask/strided_slice_2/stack_1:output:08RaggedMask/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
:*
end_mask2)
'RaggedMask/boolean_mask/strided_slice_2¯
'RaggedMask/boolean_mask/concat/values_1Pack%RaggedMask/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2)
'RaggedMask/boolean_mask/concat/values_1
#RaggedMask/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2%
#RaggedMask/boolean_mask/concat/axis¾
RaggedMask/boolean_mask/concatConcatV20RaggedMask/boolean_mask/strided_slice_1:output:00RaggedMask/boolean_mask/concat/values_1:output:00RaggedMask/boolean_mask/strided_slice_2:output:0,RaggedMask/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2 
RaggedMask/boolean_mask/concat°
RaggedMask/boolean_mask/ReshapeReshapeinputs'RaggedMask/boolean_mask/concat:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2!
RaggedMask/boolean_mask/Reshape¥
'RaggedMask/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2)
'RaggedMask/boolean_mask/Reshape_1/shape·
!RaggedMask/boolean_mask/Reshape_1Reshapemask0RaggedMask/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/boolean_mask/Reshape_1
RaggedMask/boolean_mask/WhereWhere*RaggedMask/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/boolean_mask/Where¹
RaggedMask/boolean_mask/SqueezeSqueeze%RaggedMask/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2!
RaggedMask/boolean_mask/Squeeze
%RaggedMask/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2'
%RaggedMask/boolean_mask/GatherV2/axis©
 RaggedMask/boolean_mask/GatherV2GatherV2(RaggedMask/boolean_mask/Reshape:output:0(RaggedMask/boolean_mask/Squeeze:output:0.RaggedMask/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2"
 RaggedMask/boolean_mask/GatherV2
RaggedMask/count_nonzero/zerosConst*
_output_shapes
: *
dtype0
*
value	B
 Z 2 
RaggedMask/count_nonzero/zeros¼
!RaggedMask/count_nonzero/NotEqualNotEqualmask'RaggedMask/count_nonzero/zeros:output:0*
T0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/count_nonzero/NotEqual·
RaggedMask/count_nonzero/CastCast%RaggedMask/count_nonzero/NotEqual:z:0*

DstT0	*

SrcT0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Cast«
.RaggedMask/count_nonzero/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ20
.RaggedMask/count_nonzero/Sum/reduction_indicesÍ
RaggedMask/count_nonzero/SumSum!RaggedMask/count_nonzero/Cast:y:07RaggedMask/count_nonzero/Sum/reduction_indices:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Sum
RaggedMask/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2
RaggedMask/Reshape/shape«
RaggedMask/ReshapeReshape%RaggedMask/count_nonzero/Sum:output:0!RaggedMask/Reshape/shape:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/ReshapeÒ
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis¬
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/CumsumCumsumRaggedMask/Reshape:output:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsumâ
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Const*
_output_shapes
:*
dtype0	*
valueB	R 2L
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Ò
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis¸
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatConcatV2SRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0:output:0GRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum:out:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis:output:0*
N*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatÊ
&RaggedReduceMean/RaggedReduceSum/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:2(
&RaggedReduceMean/RaggedReduceSum/Shape¶
4RaggedReduceMean/RaggedReduceSum/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 26
4RaggedReduceMean/RaggedReduceSum/strided_slice/stackº
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:28
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_1º
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:28
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_2¨
.RaggedReduceMean/RaggedReduceSum/strided_sliceStridedSlice/RaggedReduceMean/RaggedReduceSum/Shape:output:0=RaggedReduceMean/RaggedReduceSum/strided_slice/stack:output:0?RaggedReduceMean/RaggedReduceSum/strided_slice/stack_1:output:0?RaggedReduceMean/RaggedReduceSum/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask20
.RaggedReduceMean/RaggedReduceSum/strided_slice
&RaggedReduceMean/RaggedReduceSum/sub/yConst*
_output_shapes
: *
dtype0*
value	B :2(
&RaggedReduceMean/RaggedReduceSum/sub/yÞ
$RaggedReduceMean/RaggedReduceSum/subSub7RaggedReduceMean/RaggedReduceSum/strided_slice:output:0/RaggedReduceMean/RaggedReduceSum/sub/y:output:0*
T0*
_output_shapes
: 2&
$RaggedReduceMean/RaggedReduceSum/subè
MRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2O
MRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stackì
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_1ì
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_2Å
GRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_sliceStridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_1:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
end_mask2I
GRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_sliceì
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stackù
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_1ð
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Ñ
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1StridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_1:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask2K
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1Ù
=RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/subSubPRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice:output:0RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2?
=RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:*
out_type0	2A
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Shapeõ
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stackð
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_1ð
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_2È
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2StridedSliceHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Shape:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_1:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_2:output:0*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask2K
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2È
ARaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2C
ARaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1/yÊ
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1SubRRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2:output:0JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1/y:output:0*
T0	*
_output_shapes
: 2A
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1Ð
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/startConst*
_output_shapes
: *
dtype0*
value	B : 2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/startÐ
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/delta
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/CastCastNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/start:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2F
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast_1CastNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/delta:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2H
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast_1
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/rangeRangeHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast:y:0CRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1:z:0JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast_1:y:0*

Tidx0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2A
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/CastCastARaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub:z:0*

DstT0*

SrcT0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Cast
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ShapeShapeHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range:output:0*
T0	*
_output_shapes
:2H
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Shapeö
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2V
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackú
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1ú
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2è
NRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_sliceStridedSliceORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Shape:output:0]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2P
NRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice·
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shapePackWRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice:output:0*
N*
T0*
_output_shapes
:2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape
LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastToBroadcastToIRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Cast:y:0[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2N
LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastToÚ
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2H
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ConstÜ
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/MaxMaxURaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Const:output:0*
T0*
_output_shapes
: 2F
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/MaxÚ
JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum/xConst*
_output_shapes
: *
dtype0*
value	B : 2L
JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum/xä
HRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/MaximumMaximumSRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum/x:output:0MRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Max:output:0*
T0*
_output_shapes
: 2J
HRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximumì
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ConstConst*
_output_shapes
: *
dtype0*
value	B : 2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Constð
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1Const*
_output_shapes
: *
dtype0*
value	B :2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1ä
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/RangeRange\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const:output:0LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range
\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ2^
\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dim²
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims
ExpandDimsURaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dim:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Z
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDimsÔ
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/CastCastaRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims:output:0*

DstT0*

SrcT0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast¡
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/LessLess\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range:output:0VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast:y:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Lessä
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimþ
KRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims
ExpandDimsHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dim:output:0*
T0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2M
KRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDimsè
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0Const*
_output_shapes
: *
dtype0*
value	B :2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiplesPackZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0:output:0LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0*
N*
T0*
_output_shapes
:2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/TileTileTRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples:output:0*
T0	*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile¨
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ShapeShapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape
aRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2c
aRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2¢
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_sliceStridedSlice\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape:output:0jRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2]
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice
dRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2f
dRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices¦
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ProdProddRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice:output:0mRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod¬
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1ShapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2¾
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1StridedSlice^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1¬
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2ShapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2¼
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2StridedSlice^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
end_mask2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2Ñ
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1Pack[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1ø
YRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2[
YRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concatConcatV2fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1:output:0fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1:output:0fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2:output:0bRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2V
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ReshapeReshapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape«
WRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1ReshapeVRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Less:z:0fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Y
WRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1¾
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/WhereWhere`RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/WhereÛ
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/SqueezeSqueeze[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeezeü
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2]
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis³
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2GatherV2^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape:output:0^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeeze:output:0dRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2ø
3RaggedReduceMean/RaggedReduceSum/UnsortedSegmentSumUnsortedSegmentSum)RaggedMask/boolean_mask/GatherV2:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2:output:0(RaggedReduceMean/RaggedReduceSum/sub:z:0*
T0*
Tindices0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ25
3RaggedReduceMean/RaggedReduceSum/UnsortedSegmentSum
 RaggedReduceMean/ones_like/ShapeShape)RaggedMask/boolean_mask/GatherV2:output:0*
T0*
_output_shapes
:2"
 RaggedReduceMean/ones_like/Shape
 RaggedReduceMean/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?2"
 RaggedReduceMean/ones_like/ConstÈ
RaggedReduceMean/ones_likeFill)RaggedReduceMean/ones_like/Shape:output:0)RaggedReduceMean/ones_like/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedReduceMean/ones_likeÎ
(RaggedReduceMean/RaggedReduceSum_1/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:2*
(RaggedReduceMean/RaggedReduceSum_1/Shapeº
6RaggedReduceMean/RaggedReduceSum_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 28
6RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack¾
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2:
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_1¾
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2:
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_2´
0RaggedReduceMean/RaggedReduceSum_1/strided_sliceStridedSlice1RaggedReduceMean/RaggedReduceSum_1/Shape:output:0?RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack:output:0ARaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_1:output:0ARaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask22
0RaggedReduceMean/RaggedReduceSum_1/strided_slice
(RaggedReduceMean/RaggedReduceSum_1/sub/yConst*
_output_shapes
: *
dtype0*
value	B :2*
(RaggedReduceMean/RaggedReduceSum_1/sub/yæ
&RaggedReduceMean/RaggedReduceSum_1/subSub9RaggedReduceMean/RaggedReduceSum_1/strided_slice:output:01RaggedReduceMean/RaggedReduceSum_1/sub/y:output:0*
T0*
_output_shapes
: 2(
&RaggedReduceMean/RaggedReduceSum_1/subì
ORaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2Q
ORaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stackð
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_1ð
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_2Ï
IRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_sliceStridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_1:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
end_mask2K
IRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_sliceð
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stacký
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_1ô
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Û
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1StridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_1:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask2M
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1á
?RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/subSubRRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice:output:0TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2A
?RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:*
out_type0	2C
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Shapeù
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stackô
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_1ô
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_2Ô
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2StridedSliceJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Shape:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_1:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_2:output:0*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask2M
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2Ì
CRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2E
CRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1/yÒ
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1SubTRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2:output:0LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1/y:output:0*
T0	*
_output_shapes
: 2C
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1Ô
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/startConst*
_output_shapes
: *
dtype0*
value	B : 2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/startÔ
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/delta
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/CastCastPRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/start:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2H
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast_1CastPRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/delta:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2J
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast_1¡
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/rangeRangeJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast:y:0ERaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1:z:0LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast_1:y:0*

Tidx0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/CastCastCRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub:z:0*

DstT0*

SrcT0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Cast
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ShapeShapeJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range:output:0*
T0	*
_output_shapes
:2J
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Shapeú
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2X
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackþ
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1þ
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2ô
PRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_sliceStridedSliceQRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Shape:output:0_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2R
PRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice½
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shapePackYRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice:output:0*
N*
T0*
_output_shapes
:2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape
NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastToBroadcastToKRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Cast:y:0]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2P
NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastToÞ
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2J
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Constä
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/MaxMaxWRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Const:output:0*
T0*
_output_shapes
: 2H
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/MaxÞ
LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum/xConst*
_output_shapes
: *
dtype0*
value	B : 2N
LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum/xì
JRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/MaximumMaximumURaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum/x:output:0ORaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Max:output:0*
T0*
_output_shapes
: 2L
JRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximumð
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ConstConst*
_output_shapes
: *
dtype0*
value	B : 2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Constô
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1Const*
_output_shapes
: *
dtype0*
value	B :2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1î
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/RangeRange^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const:output:0NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range
^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ2`
^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dimº
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims
ExpandDimsWRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dim:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2\
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDimsÚ
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/CastCastcRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims:output:0*

DstT0*

SrcT0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast©
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/LessLess^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range:output:0XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast:y:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Lessè
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dim
MRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims
ExpandDimsJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dim:output:0*
T0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2O
MRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDimsì
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0Const*
_output_shapes
: *
dtype0*
value	B :2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiplesPack\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0:output:0NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0*
N*
T0*
_output_shapes
:2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/TileTileVRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples:output:0*
T0	*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile®
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ShapeShapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape
cRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2e
cRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2®
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_sliceStridedSlice^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape:output:0lRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2_
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice
fRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2h
fRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices®
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ProdProdfRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice:output:0oRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod²
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1ShapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2Ê
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1StridedSlice`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1²
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2ShapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2È
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2StridedSlice`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
end_mask2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2×
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1Pack]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1ü
[RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2]
[RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concatConcatV2hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1:output:0hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1:output:0hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2:output:0dRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2X
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ReshapeReshapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape³
YRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1ReshapeXRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Less:z:0hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2[
YRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1Ä
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/WhereWherebRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Whereá
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/SqueezeSqueeze]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeeze
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2_
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis½
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2GatherV2`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape:output:0`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeeze:output:0fRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2ú
5RaggedReduceMean/RaggedReduceSum_1/UnsortedSegmentSumUnsortedSegmentSum#RaggedReduceMean/ones_like:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2:output:0*RaggedReduceMean/RaggedReduceSum_1/sub:z:0*
T0*
Tindices0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ27
5RaggedReduceMean/RaggedReduceSum_1/UnsortedSegmentSumï
RaggedReduceMean/truedivRealDiv<RaggedReduceMean/RaggedReduceSum/UnsortedSegmentSum:output:0>RaggedReduceMean/RaggedReduceSum_1/UnsortedSegmentSum:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedReduceMean/truedivp
IdentityIdentityRaggedReduceMean/truediv:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*O
_input_shapes>
<:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:\ X
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:VR
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

_user_specified_namemask
	
Û
B__inference_dense_1_layer_call_and_return_conditional_losses_16537

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: @*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
MatMul
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
BiasAdd/ReadVariableOp
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2	
BiasAdd
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ ::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
 
_user_specified_nameinputs
Ø
|
'__inference_dense_2_layer_call_fn_16575

inputs
unknown
	unknown_0
identity¢StatefulPartitionedCallò
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_151042
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@::22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
 


M__inference_watched_embeddings_layer_call_and_return_conditional_losses_14719

inputs
embedding_lookup_14713
identity¢embedding_lookupf
CastCastinputs*

DstT0*

SrcT0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
Cast
embedding_lookupResourceGatherembedding_lookup_14713Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/14713*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
dtype02
embedding_lookupõ
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/14713*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
embedding_lookup/Identity©
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
embedding_lookup/Identity_1
IdentityIdentity$embedding_lookup/Identity_1:output:0^embedding_lookup*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*3
_input_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:2$
embedding_lookupembedding_lookup:X T
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
H
Ù
@__inference_model_layer_call_and_return_conditional_losses_15343

inputs
inputs_1
watched_embeddings_15295
searched_embeddings_15300
dense_1_15310
dense_1_15312
dense_2_15316
dense_2_15318
dense_3_15322
dense_3_15324
dense_3_batch_norm_15328
dense_3_batch_norm_15330
dense_3_batch_norm_15332
dense_3_batch_norm_15334
dense_output_15337
dense_output_15339
identity¢dense_1/StatefulPartitionedCall¢dense_2/StatefulPartitionedCall¢dense_3/StatefulPartitionedCall¢*dense_3_batch_norm/StatefulPartitionedCall¢$dense_output/StatefulPartitionedCall¢+searched_embeddings/StatefulPartitionedCall¢*watched_embeddings/StatefulPartitionedCall¶
*watched_embeddings/StatefulPartitionedCallStatefulPartitionedCallinputs_1watched_embeddings_15295*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_watched_embeddings_layer_call_and_return_conditional_losses_147192,
*watched_embeddings/StatefulPartitionedCall
watched_embeddings/NotEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
watched_embeddings/NotEqual/y³
watched_embeddings/NotEqualNotEqualinputs_1&watched_embeddings/NotEqual/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
watched_embeddings/NotEqual¸
+searched_embeddings/StatefulPartitionedCallStatefulPartitionedCallinputssearched_embeddings_15300*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *W
fRRP
N__inference_searched_embeddings_layer_call_and_return_conditional_losses_147432-
+searched_embeddings/StatefulPartitionedCall
searched_embeddings/NotEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2 
searched_embeddings/NotEqual/y´
searched_embeddings/NotEqualNotEqualinputs'searched_embeddings/NotEqual/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
searched_embeddings/NotEqual²
l2_norm_1/PartitionedCallPartitionedCall3watched_embeddings/StatefulPartitionedCall:output:0watched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_l2_norm_1_layer_call_and_return_conditional_losses_148112
l2_norm_1/PartitionedCall¸
l2_norm_1/PartitionedCall_1PartitionedCall4searched_embeddings/StatefulPartitionedCall:output:0 searched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_l2_norm_1_layer_call_and_return_conditional_losses_148112
l2_norm_1/PartitionedCall_1¸
$aggregate_embeddings/PartitionedCallPartitionedCall$l2_norm_1/PartitionedCall_1:output:0 searched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_aggregate_embeddings_layer_call_and_return_conditional_losses_150292&
$aggregate_embeddings/PartitionedCall¹
&aggregate_embeddings/PartitionedCall_1PartitionedCall"l2_norm_1/PartitionedCall:output:0watched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_aggregate_embeddings_layer_call_and_return_conditional_losses_150292(
&aggregate_embeddings/PartitionedCall_1µ
concatenate/PartitionedCallPartitionedCall-aggregate_embeddings/PartitionedCall:output:0/aggregate_embeddings/PartitionedCall_1:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_concatenate_layer_call_and_return_conditional_losses_150462
concatenate/PartitionedCallª
dense_1/StatefulPartitionedCallStatefulPartitionedCall$concatenate/PartitionedCall:output:0dense_1_15310dense_1_15312*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_150652!
dense_1/StatefulPartitionedCall
dense_1_relu/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_1_relu_layer_call_and_return_conditional_losses_150862
dense_1_relu/PartitionedCall«
dense_2/StatefulPartitionedCallStatefulPartitionedCall%dense_1_relu/PartitionedCall:output:0dense_2_15316dense_2_15318*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_151042!
dense_2/StatefulPartitionedCall
dense_2_relu/PartitionedCallPartitionedCall(dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_2_relu_layer_call_and_return_conditional_losses_151252
dense_2_relu/PartitionedCall«
dense_3/StatefulPartitionedCallStatefulPartitionedCall%dense_2_relu/PartitionedCall:output:0dense_3_15322dense_3_15324*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_151432!
dense_3/StatefulPartitionedCall
dense_3_relu/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_3_relu_layer_call_and_return_conditional_losses_151642
dense_3_relu/PartitionedCall
*dense_3_batch_norm/StatefulPartitionedCallStatefulPartitionedCall%dense_3_relu/PartitionedCall:output:0dense_3_batch_norm_15328dense_3_batch_norm_15330dense_3_batch_norm_15332dense_3_batch_norm_15334*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_dense_3_batch_norm_layer_call_and_return_conditional_losses_146602,
*dense_3_batch_norm/StatefulPartitionedCallÓ
$dense_output/StatefulPartitionedCallStatefulPartitionedCall3dense_3_batch_norm/StatefulPartitionedCall:output:0dense_output_15337dense_output_15339*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_output_layer_call_and_return_conditional_losses_152182&
$dense_output/StatefulPartitionedCall
IdentityIdentity-dense_output/StatefulPartitionedCall:output:0 ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall+^dense_3_batch_norm/StatefulPartitionedCall%^dense_output/StatefulPartitionedCall,^searched_embeddings/StatefulPartitionedCall+^watched_embeddings/StatefulPartitionedCall*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2

Identity"
identityIdentity:output:0*
_input_shapesr
p:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ::::::::::::::2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2X
*dense_3_batch_norm/StatefulPartitionedCall*dense_3_batch_norm/StatefulPartitionedCall2L
$dense_output/StatefulPartitionedCall$dense_output/StatefulPartitionedCall2Z
+searched_embeddings/StatefulPartitionedCall+searched_embeddings/StatefulPartitionedCall2X
*watched_embeddings/StatefulPartitionedCall*watched_embeddings/StatefulPartitionedCall:X T
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:XT
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ÿ	
à
G__inference_dense_output_layer_call_and_return_conditional_losses_15218

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@¬*
dtype02
MatMul/ReadVariableOpt
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2
MatMul
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:¬*
dtype02
BiasAdd/ReadVariableOp
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2	
BiasAddb
SoftmaxSoftmaxBiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2	
Softmax
IdentityIdentitySoftmax:softmax:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2

Identity"
identityIdentity:output:0*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs

Á
%__inference_model_layer_call_fn_15730
inputs_0
inputs_1
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
	unknown_8
	unknown_9

unknown_10

unknown_11

unknown_12
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*0
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8 *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_154292
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2

Identity"
identityIdentity:output:0*
_input_shapesr
p:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ::::::::::::::22
StatefulPartitionedCallStatefulPartitionedCall:Z V
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/0:ZV
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/1
õ/
Â
M__inference_dense_3_batch_norm_layer_call_and_return_conditional_losses_16650

inputs
assignmovingavg_16625
assignmovingavg_1_16631)
%batchnorm_mul_readvariableop_resource%
!batchnorm_readvariableop_resource
identity¢#AssignMovingAvg/AssignSubVariableOp¢AssignMovingAvg/ReadVariableOp¢%AssignMovingAvg_1/AssignSubVariableOp¢ AssignMovingAvg_1/ReadVariableOp¢batchnorm/ReadVariableOp¢batchnorm/mul/ReadVariableOp
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2 
moments/mean/reduction_indices
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(2
moments/mean|
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

:@2
moments/StopGradient¤
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
moments/SquaredDifference
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2$
"moments/variance/reduction_indices²
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(2
moments/variance
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 2
moments/Squeeze
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 2
moments/Squeeze_1Ë
AssignMovingAvg/decayConst",/job:localhost/replica:0/task:0/device:CPU:0*(
_class
loc:@AssignMovingAvg/16625*
_output_shapes
: *
dtype0*
valueB
 *
×#<2
AssignMovingAvg/decay
AssignMovingAvg/ReadVariableOpReadVariableOpassignmovingavg_16625*
_output_shapes
:@*
dtype02 
AssignMovingAvg/ReadVariableOpð
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*(
_class
loc:@AssignMovingAvg/16625*
_output_shapes
:@2
AssignMovingAvg/subç
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*(
_class
loc:@AssignMovingAvg/16625*
_output_shapes
:@2
AssignMovingAvg/mul­
#AssignMovingAvg/AssignSubVariableOpAssignSubVariableOpassignmovingavg_16625AssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*(
_class
loc:@AssignMovingAvg/16625*
_output_shapes
 *
dtype02%
#AssignMovingAvg/AssignSubVariableOpÑ
AssignMovingAvg_1/decayConst",/job:localhost/replica:0/task:0/device:CPU:0**
_class 
loc:@AssignMovingAvg_1/16631*
_output_shapes
: *
dtype0*
valueB
 *
×#<2
AssignMovingAvg_1/decay
 AssignMovingAvg_1/ReadVariableOpReadVariableOpassignmovingavg_1_16631*
_output_shapes
:@*
dtype02"
 AssignMovingAvg_1/ReadVariableOpú
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0**
_class 
loc:@AssignMovingAvg_1/16631*
_output_shapes
:@2
AssignMovingAvg_1/subñ
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0**
_class 
loc:@AssignMovingAvg_1/16631*
_output_shapes
:@2
AssignMovingAvg_1/mul¹
%AssignMovingAvg_1/AssignSubVariableOpAssignSubVariableOpassignmovingavg_1_16631AssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0**
_class 
loc:@AssignMovingAvg_1/16631*
_output_shapes
 *
dtype02'
%AssignMovingAvg_1/AssignSubVariableOpg
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:2
batchnorm/add/y
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes
:@2
batchnorm/addc
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:@2
batchnorm/Rsqrt
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/mul/ReadVariableOp
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@2
batchnorm/mulv
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
batchnorm/mul_1{
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes
:@2
batchnorm/mul_2
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOp
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:@2
batchnorm/sub
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
batchnorm/add_1³
IdentityIdentitybatchnorm/add_1:z:0$^AssignMovingAvg/AssignSubVariableOp^AssignMovingAvg/ReadVariableOp&^AssignMovingAvg_1/AssignSubVariableOp!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ@::::2J
#AssignMovingAvg/AssignSubVariableOp#AssignMovingAvg/AssignSubVariableOp2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2N
%AssignMovingAvg_1/AssignSubVariableOp%AssignMovingAvg_1/AssignSubVariableOp2D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
ÀP
j
D__inference_l2_norm_1_layer_call_and_return_conditional_losses_14811

inputs
mask

identityt
RaggedMask/boolean_mask/ShapeShapeinputs*
T0*
_output_shapes
:2
RaggedMask/boolean_mask/Shape¤
+RaggedMask/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2-
+RaggedMask/boolean_mask/strided_slice/stack¨
-RaggedMask/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_1¨
-RaggedMask/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_2Þ
%RaggedMask/boolean_mask/strided_sliceStridedSlice&RaggedMask/boolean_mask/Shape:output:04RaggedMask/boolean_mask/strided_slice/stack:output:06RaggedMask/boolean_mask/strided_slice/stack_1:output:06RaggedMask/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2'
%RaggedMask/boolean_mask/strided_sliceª
.RaggedMask/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 20
.RaggedMask/boolean_mask/Prod/reduction_indicesÎ
RaggedMask/boolean_mask/ProdProd.RaggedMask/boolean_mask/strided_slice:output:07RaggedMask/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2
RaggedMask/boolean_mask/Prodx
RaggedMask/boolean_mask/Shape_1Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_1¨
-RaggedMask/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2/
-RaggedMask/boolean_mask/strided_slice_1/stack¬
/RaggedMask/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_1/stack_1¬
/RaggedMask/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_1/stack_2ú
'RaggedMask/boolean_mask/strided_slice_1StridedSlice(RaggedMask/boolean_mask/Shape_1:output:06RaggedMask/boolean_mask/strided_slice_1/stack:output:08RaggedMask/boolean_mask/strided_slice_1/stack_1:output:08RaggedMask/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2)
'RaggedMask/boolean_mask/strided_slice_1x
RaggedMask/boolean_mask/Shape_2Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_2¨
-RaggedMask/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice_2/stack¬
/RaggedMask/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_2/stack_1¬
/RaggedMask/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_2/stack_2ú
'RaggedMask/boolean_mask/strided_slice_2StridedSlice(RaggedMask/boolean_mask/Shape_2:output:06RaggedMask/boolean_mask/strided_slice_2/stack:output:08RaggedMask/boolean_mask/strided_slice_2/stack_1:output:08RaggedMask/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
:*
end_mask2)
'RaggedMask/boolean_mask/strided_slice_2¯
'RaggedMask/boolean_mask/concat/values_1Pack%RaggedMask/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2)
'RaggedMask/boolean_mask/concat/values_1
#RaggedMask/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2%
#RaggedMask/boolean_mask/concat/axis¾
RaggedMask/boolean_mask/concatConcatV20RaggedMask/boolean_mask/strided_slice_1:output:00RaggedMask/boolean_mask/concat/values_1:output:00RaggedMask/boolean_mask/strided_slice_2:output:0,RaggedMask/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2 
RaggedMask/boolean_mask/concat°
RaggedMask/boolean_mask/ReshapeReshapeinputs'RaggedMask/boolean_mask/concat:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2!
RaggedMask/boolean_mask/Reshape¥
'RaggedMask/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2)
'RaggedMask/boolean_mask/Reshape_1/shape·
!RaggedMask/boolean_mask/Reshape_1Reshapemask0RaggedMask/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/boolean_mask/Reshape_1
RaggedMask/boolean_mask/WhereWhere*RaggedMask/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/boolean_mask/Where¹
RaggedMask/boolean_mask/SqueezeSqueeze%RaggedMask/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2!
RaggedMask/boolean_mask/Squeeze
%RaggedMask/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2'
%RaggedMask/boolean_mask/GatherV2/axis©
 RaggedMask/boolean_mask/GatherV2GatherV2(RaggedMask/boolean_mask/Reshape:output:0(RaggedMask/boolean_mask/Squeeze:output:0.RaggedMask/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2"
 RaggedMask/boolean_mask/GatherV2
RaggedMask/count_nonzero/zerosConst*
_output_shapes
: *
dtype0
*
value	B
 Z 2 
RaggedMask/count_nonzero/zeros¼
!RaggedMask/count_nonzero/NotEqualNotEqualmask'RaggedMask/count_nonzero/zeros:output:0*
T0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/count_nonzero/NotEqual·
RaggedMask/count_nonzero/CastCast%RaggedMask/count_nonzero/NotEqual:z:0*

DstT0	*

SrcT0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Cast«
.RaggedMask/count_nonzero/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ20
.RaggedMask/count_nonzero/Sum/reduction_indicesÍ
RaggedMask/count_nonzero/SumSum!RaggedMask/count_nonzero/Cast:y:07RaggedMask/count_nonzero/Sum/reduction_indices:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Sum
RaggedMask/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2
RaggedMask/Reshape/shape«
RaggedMask/ReshapeReshape%RaggedMask/count_nonzero/Sum:output:0!RaggedMask/Reshape/shape:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/ReshapeÒ
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis¬
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/CumsumCumsumRaggedMask/Reshape:output:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsumâ
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Const*
_output_shapes
:*
dtype0	*
valueB	R 2L
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Ò
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis¸
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatConcatV2SRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0:output:0GRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum:out:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis:output:0*
N*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatq
RaggedToTensor/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    2
RaggedToTensor/zerosw
RaggedToTensor/ConstConst*
_output_shapes
: *
dtype0	*
valueB	 R
ÿÿÿÿÿÿÿÿÿ2
RaggedToTensor/Constº
#RaggedToTensor/RaggedTensorToTensorRaggedTensorToTensorRaggedToTensor/Const:output:0)RaggedMask/boolean_mask/GatherV2:output:0RaggedToTensor/zeros:output:0JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0*
Tindex0	*
Tshape0	*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
num_row_partition_tensors*%
row_partition_types

ROW_SPLITS2%
#RaggedToTensor/RaggedTensorToTensor¡
l2_normalize/SquareSquare,RaggedToTensor/RaggedTensorToTensor:result:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalize/Square
"l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ2$
"l2_normalize/Sum/reduction_indicesÁ
l2_normalize/SumSuml2_normalize/Square:y:0+l2_normalize/Sum/reduction_indices:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
	keep_dims(2
l2_normalize/Sumu
l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ì¼+2
l2_normalize/Maximum/y²
l2_normalize/MaximumMaximuml2_normalize/Sum:output:0l2_normalize/Maximum/y:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalize/Maximum
l2_normalize/RsqrtRsqrtl2_normalize/Maximum:z:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalize/Rsqrt¨
l2_normalizeMul,RaggedToTensor/RaggedTensorToTensor:result:0l2_normalize/Rsqrt:y:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalizeq
IdentityIdentityl2_normalize:z:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*O
_input_shapes>
<:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:\ X
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:VR
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

_user_specified_namemask
 


M__inference_watched_embeddings_layer_call_and_return_conditional_losses_15757

inputs
embedding_lookup_15751
identity¢embedding_lookupf
CastCastinputs*

DstT0*

SrcT0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
Cast
embedding_lookupResourceGatherembedding_lookup_15751Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/15751*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
dtype02
embedding_lookupõ
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/15751*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
embedding_lookup/Identity©
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
embedding_lookup/Identity_1
IdentityIdentity$embedding_lookup/Identity_1:output:0^embedding_lookup*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*3
_input_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:2$
embedding_lookupembedding_lookup:X T
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
àç
u
O__inference_aggregate_embeddings_layer_call_and_return_conditional_losses_15029

inputs
mask

identityt
RaggedMask/boolean_mask/ShapeShapeinputs*
T0*
_output_shapes
:2
RaggedMask/boolean_mask/Shape¤
+RaggedMask/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2-
+RaggedMask/boolean_mask/strided_slice/stack¨
-RaggedMask/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_1¨
-RaggedMask/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_2Þ
%RaggedMask/boolean_mask/strided_sliceStridedSlice&RaggedMask/boolean_mask/Shape:output:04RaggedMask/boolean_mask/strided_slice/stack:output:06RaggedMask/boolean_mask/strided_slice/stack_1:output:06RaggedMask/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2'
%RaggedMask/boolean_mask/strided_sliceª
.RaggedMask/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 20
.RaggedMask/boolean_mask/Prod/reduction_indicesÎ
RaggedMask/boolean_mask/ProdProd.RaggedMask/boolean_mask/strided_slice:output:07RaggedMask/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2
RaggedMask/boolean_mask/Prodx
RaggedMask/boolean_mask/Shape_1Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_1¨
-RaggedMask/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2/
-RaggedMask/boolean_mask/strided_slice_1/stack¬
/RaggedMask/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_1/stack_1¬
/RaggedMask/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_1/stack_2ú
'RaggedMask/boolean_mask/strided_slice_1StridedSlice(RaggedMask/boolean_mask/Shape_1:output:06RaggedMask/boolean_mask/strided_slice_1/stack:output:08RaggedMask/boolean_mask/strided_slice_1/stack_1:output:08RaggedMask/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2)
'RaggedMask/boolean_mask/strided_slice_1x
RaggedMask/boolean_mask/Shape_2Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_2¨
-RaggedMask/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice_2/stack¬
/RaggedMask/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_2/stack_1¬
/RaggedMask/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_2/stack_2ú
'RaggedMask/boolean_mask/strided_slice_2StridedSlice(RaggedMask/boolean_mask/Shape_2:output:06RaggedMask/boolean_mask/strided_slice_2/stack:output:08RaggedMask/boolean_mask/strided_slice_2/stack_1:output:08RaggedMask/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
:*
end_mask2)
'RaggedMask/boolean_mask/strided_slice_2¯
'RaggedMask/boolean_mask/concat/values_1Pack%RaggedMask/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2)
'RaggedMask/boolean_mask/concat/values_1
#RaggedMask/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2%
#RaggedMask/boolean_mask/concat/axis¾
RaggedMask/boolean_mask/concatConcatV20RaggedMask/boolean_mask/strided_slice_1:output:00RaggedMask/boolean_mask/concat/values_1:output:00RaggedMask/boolean_mask/strided_slice_2:output:0,RaggedMask/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2 
RaggedMask/boolean_mask/concat°
RaggedMask/boolean_mask/ReshapeReshapeinputs'RaggedMask/boolean_mask/concat:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2!
RaggedMask/boolean_mask/Reshape¥
'RaggedMask/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2)
'RaggedMask/boolean_mask/Reshape_1/shape·
!RaggedMask/boolean_mask/Reshape_1Reshapemask0RaggedMask/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/boolean_mask/Reshape_1
RaggedMask/boolean_mask/WhereWhere*RaggedMask/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/boolean_mask/Where¹
RaggedMask/boolean_mask/SqueezeSqueeze%RaggedMask/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2!
RaggedMask/boolean_mask/Squeeze
%RaggedMask/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2'
%RaggedMask/boolean_mask/GatherV2/axis©
 RaggedMask/boolean_mask/GatherV2GatherV2(RaggedMask/boolean_mask/Reshape:output:0(RaggedMask/boolean_mask/Squeeze:output:0.RaggedMask/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2"
 RaggedMask/boolean_mask/GatherV2
RaggedMask/count_nonzero/zerosConst*
_output_shapes
: *
dtype0
*
value	B
 Z 2 
RaggedMask/count_nonzero/zeros¼
!RaggedMask/count_nonzero/NotEqualNotEqualmask'RaggedMask/count_nonzero/zeros:output:0*
T0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/count_nonzero/NotEqual·
RaggedMask/count_nonzero/CastCast%RaggedMask/count_nonzero/NotEqual:z:0*

DstT0	*

SrcT0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Cast«
.RaggedMask/count_nonzero/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ20
.RaggedMask/count_nonzero/Sum/reduction_indicesÍ
RaggedMask/count_nonzero/SumSum!RaggedMask/count_nonzero/Cast:y:07RaggedMask/count_nonzero/Sum/reduction_indices:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Sum
RaggedMask/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2
RaggedMask/Reshape/shape«
RaggedMask/ReshapeReshape%RaggedMask/count_nonzero/Sum:output:0!RaggedMask/Reshape/shape:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/ReshapeÒ
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis¬
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/CumsumCumsumRaggedMask/Reshape:output:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsumâ
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Const*
_output_shapes
:*
dtype0	*
valueB	R 2L
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Ò
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis¸
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatConcatV2SRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0:output:0GRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum:out:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis:output:0*
N*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatÊ
&RaggedReduceMean/RaggedReduceSum/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:2(
&RaggedReduceMean/RaggedReduceSum/Shape¶
4RaggedReduceMean/RaggedReduceSum/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 26
4RaggedReduceMean/RaggedReduceSum/strided_slice/stackº
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:28
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_1º
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:28
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_2¨
.RaggedReduceMean/RaggedReduceSum/strided_sliceStridedSlice/RaggedReduceMean/RaggedReduceSum/Shape:output:0=RaggedReduceMean/RaggedReduceSum/strided_slice/stack:output:0?RaggedReduceMean/RaggedReduceSum/strided_slice/stack_1:output:0?RaggedReduceMean/RaggedReduceSum/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask20
.RaggedReduceMean/RaggedReduceSum/strided_slice
&RaggedReduceMean/RaggedReduceSum/sub/yConst*
_output_shapes
: *
dtype0*
value	B :2(
&RaggedReduceMean/RaggedReduceSum/sub/yÞ
$RaggedReduceMean/RaggedReduceSum/subSub7RaggedReduceMean/RaggedReduceSum/strided_slice:output:0/RaggedReduceMean/RaggedReduceSum/sub/y:output:0*
T0*
_output_shapes
: 2&
$RaggedReduceMean/RaggedReduceSum/subè
MRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2O
MRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stackì
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_1ì
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_2Å
GRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_sliceStridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_1:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
end_mask2I
GRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_sliceì
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stackù
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_1ð
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Ñ
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1StridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_1:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask2K
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1Ù
=RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/subSubPRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice:output:0RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2?
=RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:*
out_type0	2A
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Shapeõ
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stackð
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_1ð
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_2È
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2StridedSliceHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Shape:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_1:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_2:output:0*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask2K
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2È
ARaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2C
ARaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1/yÊ
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1SubRRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2:output:0JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1/y:output:0*
T0	*
_output_shapes
: 2A
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1Ð
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/startConst*
_output_shapes
: *
dtype0*
value	B : 2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/startÐ
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/delta
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/CastCastNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/start:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2F
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast_1CastNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/delta:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2H
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast_1
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/rangeRangeHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast:y:0CRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1:z:0JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast_1:y:0*

Tidx0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2A
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/CastCastARaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub:z:0*

DstT0*

SrcT0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Cast
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ShapeShapeHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range:output:0*
T0	*
_output_shapes
:2H
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Shapeö
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2V
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackú
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1ú
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2è
NRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_sliceStridedSliceORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Shape:output:0]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2P
NRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice·
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shapePackWRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice:output:0*
N*
T0*
_output_shapes
:2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape
LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastToBroadcastToIRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Cast:y:0[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2N
LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastToÚ
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2H
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ConstÜ
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/MaxMaxURaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Const:output:0*
T0*
_output_shapes
: 2F
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/MaxÚ
JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum/xConst*
_output_shapes
: *
dtype0*
value	B : 2L
JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum/xä
HRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/MaximumMaximumSRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum/x:output:0MRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Max:output:0*
T0*
_output_shapes
: 2J
HRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximumì
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ConstConst*
_output_shapes
: *
dtype0*
value	B : 2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Constð
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1Const*
_output_shapes
: *
dtype0*
value	B :2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1ä
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/RangeRange\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const:output:0LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range
\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ2^
\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dim²
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims
ExpandDimsURaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dim:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Z
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDimsÔ
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/CastCastaRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims:output:0*

DstT0*

SrcT0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast¡
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/LessLess\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range:output:0VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast:y:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Lessä
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimþ
KRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims
ExpandDimsHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dim:output:0*
T0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2M
KRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDimsè
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0Const*
_output_shapes
: *
dtype0*
value	B :2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiplesPackZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0:output:0LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0*
N*
T0*
_output_shapes
:2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/TileTileTRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples:output:0*
T0	*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile¨
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ShapeShapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape
aRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2c
aRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2¢
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_sliceStridedSlice\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape:output:0jRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2]
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice
dRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2f
dRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices¦
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ProdProddRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice:output:0mRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod¬
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1ShapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2¾
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1StridedSlice^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1¬
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2ShapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2¼
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2StridedSlice^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
end_mask2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2Ñ
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1Pack[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1ø
YRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2[
YRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concatConcatV2fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1:output:0fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1:output:0fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2:output:0bRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2V
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ReshapeReshapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape«
WRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1ReshapeVRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Less:z:0fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Y
WRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1¾
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/WhereWhere`RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/WhereÛ
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/SqueezeSqueeze[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeezeü
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2]
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis³
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2GatherV2^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape:output:0^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeeze:output:0dRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2ø
3RaggedReduceMean/RaggedReduceSum/UnsortedSegmentSumUnsortedSegmentSum)RaggedMask/boolean_mask/GatherV2:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2:output:0(RaggedReduceMean/RaggedReduceSum/sub:z:0*
T0*
Tindices0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ25
3RaggedReduceMean/RaggedReduceSum/UnsortedSegmentSum
 RaggedReduceMean/ones_like/ShapeShape)RaggedMask/boolean_mask/GatherV2:output:0*
T0*
_output_shapes
:2"
 RaggedReduceMean/ones_like/Shape
 RaggedReduceMean/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?2"
 RaggedReduceMean/ones_like/ConstÈ
RaggedReduceMean/ones_likeFill)RaggedReduceMean/ones_like/Shape:output:0)RaggedReduceMean/ones_like/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedReduceMean/ones_likeÎ
(RaggedReduceMean/RaggedReduceSum_1/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:2*
(RaggedReduceMean/RaggedReduceSum_1/Shapeº
6RaggedReduceMean/RaggedReduceSum_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 28
6RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack¾
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2:
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_1¾
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2:
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_2´
0RaggedReduceMean/RaggedReduceSum_1/strided_sliceStridedSlice1RaggedReduceMean/RaggedReduceSum_1/Shape:output:0?RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack:output:0ARaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_1:output:0ARaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask22
0RaggedReduceMean/RaggedReduceSum_1/strided_slice
(RaggedReduceMean/RaggedReduceSum_1/sub/yConst*
_output_shapes
: *
dtype0*
value	B :2*
(RaggedReduceMean/RaggedReduceSum_1/sub/yæ
&RaggedReduceMean/RaggedReduceSum_1/subSub9RaggedReduceMean/RaggedReduceSum_1/strided_slice:output:01RaggedReduceMean/RaggedReduceSum_1/sub/y:output:0*
T0*
_output_shapes
: 2(
&RaggedReduceMean/RaggedReduceSum_1/subì
ORaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2Q
ORaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stackð
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_1ð
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_2Ï
IRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_sliceStridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_1:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
end_mask2K
IRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_sliceð
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stacký
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_1ô
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Û
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1StridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_1:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask2M
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1á
?RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/subSubRRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice:output:0TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2A
?RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:*
out_type0	2C
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Shapeù
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stackô
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_1ô
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_2Ô
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2StridedSliceJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Shape:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_1:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_2:output:0*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask2M
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2Ì
CRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2E
CRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1/yÒ
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1SubTRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2:output:0LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1/y:output:0*
T0	*
_output_shapes
: 2C
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1Ô
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/startConst*
_output_shapes
: *
dtype0*
value	B : 2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/startÔ
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/delta
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/CastCastPRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/start:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2H
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast_1CastPRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/delta:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2J
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast_1¡
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/rangeRangeJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast:y:0ERaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1:z:0LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast_1:y:0*

Tidx0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/CastCastCRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub:z:0*

DstT0*

SrcT0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Cast
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ShapeShapeJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range:output:0*
T0	*
_output_shapes
:2J
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Shapeú
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2X
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackþ
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1þ
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2ô
PRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_sliceStridedSliceQRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Shape:output:0_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2R
PRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice½
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shapePackYRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice:output:0*
N*
T0*
_output_shapes
:2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape
NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastToBroadcastToKRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Cast:y:0]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2P
NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastToÞ
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2J
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Constä
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/MaxMaxWRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Const:output:0*
T0*
_output_shapes
: 2H
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/MaxÞ
LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum/xConst*
_output_shapes
: *
dtype0*
value	B : 2N
LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum/xì
JRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/MaximumMaximumURaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum/x:output:0ORaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Max:output:0*
T0*
_output_shapes
: 2L
JRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximumð
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ConstConst*
_output_shapes
: *
dtype0*
value	B : 2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Constô
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1Const*
_output_shapes
: *
dtype0*
value	B :2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1î
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/RangeRange^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const:output:0NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range
^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ2`
^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dimº
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims
ExpandDimsWRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dim:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2\
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDimsÚ
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/CastCastcRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims:output:0*

DstT0*

SrcT0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast©
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/LessLess^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range:output:0XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast:y:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Lessè
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dim
MRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims
ExpandDimsJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dim:output:0*
T0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2O
MRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDimsì
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0Const*
_output_shapes
: *
dtype0*
value	B :2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiplesPack\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0:output:0NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0*
N*
T0*
_output_shapes
:2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/TileTileVRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples:output:0*
T0	*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile®
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ShapeShapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape
cRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2e
cRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2®
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_sliceStridedSlice^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape:output:0lRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2_
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice
fRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2h
fRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices®
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ProdProdfRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice:output:0oRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod²
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1ShapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2Ê
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1StridedSlice`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1²
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2ShapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2È
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2StridedSlice`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
end_mask2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2×
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1Pack]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1ü
[RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2]
[RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concatConcatV2hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1:output:0hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1:output:0hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2:output:0dRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2X
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ReshapeReshapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape³
YRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1ReshapeXRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Less:z:0hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2[
YRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1Ä
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/WhereWherebRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Whereá
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/SqueezeSqueeze]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeeze
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2_
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis½
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2GatherV2`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape:output:0`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeeze:output:0fRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2ú
5RaggedReduceMean/RaggedReduceSum_1/UnsortedSegmentSumUnsortedSegmentSum#RaggedReduceMean/ones_like:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2:output:0*RaggedReduceMean/RaggedReduceSum_1/sub:z:0*
T0*
Tindices0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ27
5RaggedReduceMean/RaggedReduceSum_1/UnsortedSegmentSumï
RaggedReduceMean/truedivRealDiv<RaggedReduceMean/RaggedReduceSum/UnsortedSegmentSum:output:0>RaggedReduceMean/RaggedReduceSum_1/UnsortedSegmentSum:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedReduceMean/truedivp
IdentityIdentityRaggedReduceMean/truediv:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*O
_input_shapes>
<:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:\ X
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:VR
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

_user_specified_namemask
	
Û
B__inference_dense_3_layer_call_and_return_conditional_losses_15143

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@@*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
MatMul
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
BiasAdd/ReadVariableOp
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2	
BiasAdd
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs

W
+__inference_concatenate_layer_call_fn_16527
inputs_0
inputs_1
identityÑ
PartitionedCallPartitionedCallinputs_0inputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_concatenate_layer_call_and_return_conditional_losses_150462
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 2

Identity"
identityIdentity:output:0*9
_input_shapes(
&:ÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿ:Q M
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/1
µ
c
G__inference_dense_2_relu_layer_call_and_return_conditional_losses_16580

inputs
identityN
ReluReluinputs*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
Reluf
IdentityIdentityRelu:activations:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*&
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
Ð

M__inference_dense_3_batch_norm_layer_call_and_return_conditional_losses_16670

inputs%
!batchnorm_readvariableop_resource)
%batchnorm_mul_readvariableop_resource'
#batchnorm_readvariableop_1_resource'
#batchnorm_readvariableop_2_resource
identity¢batchnorm/ReadVariableOp¢batchnorm/ReadVariableOp_1¢batchnorm/ReadVariableOp_2¢batchnorm/mul/ReadVariableOp
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOpg
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:2
batchnorm/add/y
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes
:@2
batchnorm/addc
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
:@2
batchnorm/Rsqrt
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype02
batchnorm/mul/ReadVariableOp
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@2
batchnorm/mulv
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
batchnorm/mul_1
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOp_1
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes
:@2
batchnorm/mul_2
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes
:@*
dtype02
batchnorm/ReadVariableOp_2
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
:@2
batchnorm/sub
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
batchnorm/add_1Û
IdentityIdentitybatchnorm/add_1:z:0^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ@::::24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
¯
¥
2__inference_dense_3_batch_norm_layer_call_fn_16696

inputs
unknown
	unknown_0
	unknown_1
	unknown_2
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_dense_3_batch_norm_layer_call_and_return_conditional_losses_146932
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ@::::22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
P
<
__inference_call_15932

inputs
mask

identityt
RaggedMask/boolean_mask/ShapeShapeinputs*
T0*
_output_shapes
:2
RaggedMask/boolean_mask/Shape¤
+RaggedMask/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2-
+RaggedMask/boolean_mask/strided_slice/stack¨
-RaggedMask/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_1¨
-RaggedMask/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_2Þ
%RaggedMask/boolean_mask/strided_sliceStridedSlice&RaggedMask/boolean_mask/Shape:output:04RaggedMask/boolean_mask/strided_slice/stack:output:06RaggedMask/boolean_mask/strided_slice/stack_1:output:06RaggedMask/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2'
%RaggedMask/boolean_mask/strided_sliceª
.RaggedMask/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 20
.RaggedMask/boolean_mask/Prod/reduction_indicesÎ
RaggedMask/boolean_mask/ProdProd.RaggedMask/boolean_mask/strided_slice:output:07RaggedMask/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2
RaggedMask/boolean_mask/Prodx
RaggedMask/boolean_mask/Shape_1Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_1¨
-RaggedMask/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2/
-RaggedMask/boolean_mask/strided_slice_1/stack¬
/RaggedMask/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_1/stack_1¬
/RaggedMask/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_1/stack_2ú
'RaggedMask/boolean_mask/strided_slice_1StridedSlice(RaggedMask/boolean_mask/Shape_1:output:06RaggedMask/boolean_mask/strided_slice_1/stack:output:08RaggedMask/boolean_mask/strided_slice_1/stack_1:output:08RaggedMask/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2)
'RaggedMask/boolean_mask/strided_slice_1x
RaggedMask/boolean_mask/Shape_2Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_2¨
-RaggedMask/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice_2/stack¬
/RaggedMask/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_2/stack_1¬
/RaggedMask/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_2/stack_2ú
'RaggedMask/boolean_mask/strided_slice_2StridedSlice(RaggedMask/boolean_mask/Shape_2:output:06RaggedMask/boolean_mask/strided_slice_2/stack:output:08RaggedMask/boolean_mask/strided_slice_2/stack_1:output:08RaggedMask/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
:*
end_mask2)
'RaggedMask/boolean_mask/strided_slice_2¯
'RaggedMask/boolean_mask/concat/values_1Pack%RaggedMask/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2)
'RaggedMask/boolean_mask/concat/values_1
#RaggedMask/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2%
#RaggedMask/boolean_mask/concat/axis¾
RaggedMask/boolean_mask/concatConcatV20RaggedMask/boolean_mask/strided_slice_1:output:00RaggedMask/boolean_mask/concat/values_1:output:00RaggedMask/boolean_mask/strided_slice_2:output:0,RaggedMask/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2 
RaggedMask/boolean_mask/concat°
RaggedMask/boolean_mask/ReshapeReshapeinputs'RaggedMask/boolean_mask/concat:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2!
RaggedMask/boolean_mask/Reshape¥
'RaggedMask/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2)
'RaggedMask/boolean_mask/Reshape_1/shape·
!RaggedMask/boolean_mask/Reshape_1Reshapemask0RaggedMask/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/boolean_mask/Reshape_1
RaggedMask/boolean_mask/WhereWhere*RaggedMask/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/boolean_mask/Where¹
RaggedMask/boolean_mask/SqueezeSqueeze%RaggedMask/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2!
RaggedMask/boolean_mask/Squeeze
%RaggedMask/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2'
%RaggedMask/boolean_mask/GatherV2/axis©
 RaggedMask/boolean_mask/GatherV2GatherV2(RaggedMask/boolean_mask/Reshape:output:0(RaggedMask/boolean_mask/Squeeze:output:0.RaggedMask/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2"
 RaggedMask/boolean_mask/GatherV2
RaggedMask/count_nonzero/zerosConst*
_output_shapes
: *
dtype0
*
value	B
 Z 2 
RaggedMask/count_nonzero/zeros¼
!RaggedMask/count_nonzero/NotEqualNotEqualmask'RaggedMask/count_nonzero/zeros:output:0*
T0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/count_nonzero/NotEqual·
RaggedMask/count_nonzero/CastCast%RaggedMask/count_nonzero/NotEqual:z:0*

DstT0	*

SrcT0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Cast«
.RaggedMask/count_nonzero/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ20
.RaggedMask/count_nonzero/Sum/reduction_indicesÍ
RaggedMask/count_nonzero/SumSum!RaggedMask/count_nonzero/Cast:y:07RaggedMask/count_nonzero/Sum/reduction_indices:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Sum
RaggedMask/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2
RaggedMask/Reshape/shape«
RaggedMask/ReshapeReshape%RaggedMask/count_nonzero/Sum:output:0!RaggedMask/Reshape/shape:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/ReshapeÒ
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis¬
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/CumsumCumsumRaggedMask/Reshape:output:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsumâ
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Const*
_output_shapes
:*
dtype0	*
valueB	R 2L
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Ò
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis¸
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatConcatV2SRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0:output:0GRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum:out:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis:output:0*
N*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatq
RaggedToTensor/zerosConst*
_output_shapes
: *
dtype0*
valueB
 *    2
RaggedToTensor/zerosw
RaggedToTensor/ConstConst*
_output_shapes
: *
dtype0	*
valueB	 R
ÿÿÿÿÿÿÿÿÿ2
RaggedToTensor/Constº
#RaggedToTensor/RaggedTensorToTensorRaggedTensorToTensorRaggedToTensor/Const:output:0)RaggedMask/boolean_mask/GatherV2:output:0RaggedToTensor/zeros:output:0JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0*
Tindex0	*
Tshape0	*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
num_row_partition_tensors*%
row_partition_types

ROW_SPLITS2%
#RaggedToTensor/RaggedTensorToTensor¡
l2_normalize/SquareSquare,RaggedToTensor/RaggedTensorToTensor:result:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalize/Square
"l2_normalize/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ2$
"l2_normalize/Sum/reduction_indicesÁ
l2_normalize/SumSuml2_normalize/Square:y:0+l2_normalize/Sum/reduction_indices:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
	keep_dims(2
l2_normalize/Sumu
l2_normalize/Maximum/yConst*
_output_shapes
: *
dtype0*
valueB
 *Ì¼+2
l2_normalize/Maximum/y²
l2_normalize/MaximumMaximuml2_normalize/Sum:output:0l2_normalize/Maximum/y:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalize/Maximum
l2_normalize/RsqrtRsqrtl2_normalize/Maximum:z:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalize/Rsqrt¨
l2_normalizeMul,RaggedToTensor/RaggedTensorToTensor:result:0l2_normalize/Rsqrt:y:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
l2_normalizeq
IdentityIdentityl2_normalize:z:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*O
_input_shapes>
<:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:\ X
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:VR
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

_user_specified_namemask
å

,__inference_dense_output_layer_call_fn_16716

inputs
unknown
	unknown_0
identity¢StatefulPartitionedCallø
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_output_layer_call_and_return_conditional_losses_152182
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2

Identity"
identityIdentity:output:0*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@::22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
­
¥
2__inference_dense_3_batch_norm_layer_call_fn_16683

inputs
unknown
	unknown_0
	unknown_1
	unknown_2
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_dense_3_batch_norm_layer_call_and_return_conditional_losses_146602
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ@::::22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
H
Ù
@__inference_model_layer_call_and_return_conditional_losses_15429

inputs
inputs_1
watched_embeddings_15381
searched_embeddings_15386
dense_1_15396
dense_1_15398
dense_2_15402
dense_2_15404
dense_3_15408
dense_3_15410
dense_3_batch_norm_15414
dense_3_batch_norm_15416
dense_3_batch_norm_15418
dense_3_batch_norm_15420
dense_output_15423
dense_output_15425
identity¢dense_1/StatefulPartitionedCall¢dense_2/StatefulPartitionedCall¢dense_3/StatefulPartitionedCall¢*dense_3_batch_norm/StatefulPartitionedCall¢$dense_output/StatefulPartitionedCall¢+searched_embeddings/StatefulPartitionedCall¢*watched_embeddings/StatefulPartitionedCall¶
*watched_embeddings/StatefulPartitionedCallStatefulPartitionedCallinputs_1watched_embeddings_15381*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_watched_embeddings_layer_call_and_return_conditional_losses_147192,
*watched_embeddings/StatefulPartitionedCall
watched_embeddings/NotEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
watched_embeddings/NotEqual/y³
watched_embeddings/NotEqualNotEqualinputs_1&watched_embeddings/NotEqual/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
watched_embeddings/NotEqual¸
+searched_embeddings/StatefulPartitionedCallStatefulPartitionedCallinputssearched_embeddings_15386*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *W
fRRP
N__inference_searched_embeddings_layer_call_and_return_conditional_losses_147432-
+searched_embeddings/StatefulPartitionedCall
searched_embeddings/NotEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2 
searched_embeddings/NotEqual/y´
searched_embeddings/NotEqualNotEqualinputs'searched_embeddings/NotEqual/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
searched_embeddings/NotEqual²
l2_norm_1/PartitionedCallPartitionedCall3watched_embeddings/StatefulPartitionedCall:output:0watched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_l2_norm_1_layer_call_and_return_conditional_losses_148112
l2_norm_1/PartitionedCall¸
l2_norm_1/PartitionedCall_1PartitionedCall4searched_embeddings/StatefulPartitionedCall:output:0 searched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_l2_norm_1_layer_call_and_return_conditional_losses_148112
l2_norm_1/PartitionedCall_1¸
$aggregate_embeddings/PartitionedCallPartitionedCall$l2_norm_1/PartitionedCall_1:output:0 searched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_aggregate_embeddings_layer_call_and_return_conditional_losses_150292&
$aggregate_embeddings/PartitionedCall¹
&aggregate_embeddings/PartitionedCall_1PartitionedCall"l2_norm_1/PartitionedCall:output:0watched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *X
fSRQ
O__inference_aggregate_embeddings_layer_call_and_return_conditional_losses_150292(
&aggregate_embeddings/PartitionedCall_1µ
concatenate/PartitionedCallPartitionedCall-aggregate_embeddings/PartitionedCall:output:0/aggregate_embeddings/PartitionedCall_1:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *O
fJRH
F__inference_concatenate_layer_call_and_return_conditional_losses_150462
concatenate/PartitionedCallª
dense_1/StatefulPartitionedCallStatefulPartitionedCall$concatenate/PartitionedCall:output:0dense_1_15396dense_1_15398*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_150652!
dense_1/StatefulPartitionedCall
dense_1_relu/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_1_relu_layer_call_and_return_conditional_losses_150862
dense_1_relu/PartitionedCall«
dense_2/StatefulPartitionedCallStatefulPartitionedCall%dense_1_relu/PartitionedCall:output:0dense_2_15402dense_2_15404*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_151042!
dense_2/StatefulPartitionedCall
dense_2_relu/PartitionedCallPartitionedCall(dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_2_relu_layer_call_and_return_conditional_losses_151252
dense_2_relu/PartitionedCall«
dense_3/StatefulPartitionedCallStatefulPartitionedCall%dense_2_relu/PartitionedCall:output:0dense_3_15408dense_3_15410*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_151432!
dense_3/StatefulPartitionedCall
dense_3_relu/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_3_relu_layer_call_and_return_conditional_losses_151642
dense_3_relu/PartitionedCall
*dense_3_batch_norm/StatefulPartitionedCallStatefulPartitionedCall%dense_3_relu/PartitionedCall:output:0dense_3_batch_norm_15414dense_3_batch_norm_15416dense_3_batch_norm_15418dense_3_batch_norm_15420*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_dense_3_batch_norm_layer_call_and_return_conditional_losses_146932,
*dense_3_batch_norm/StatefulPartitionedCallÓ
$dense_output/StatefulPartitionedCallStatefulPartitionedCall3dense_3_batch_norm/StatefulPartitionedCall:output:0dense_output_15423dense_output_15425*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_output_layer_call_and_return_conditional_losses_152182&
$dense_output/StatefulPartitionedCall
IdentityIdentity-dense_output/StatefulPartitionedCall:output:0 ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall+^dense_3_batch_norm/StatefulPartitionedCall%^dense_output/StatefulPartitionedCall,^searched_embeddings/StatefulPartitionedCall+^watched_embeddings/StatefulPartitionedCall*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2

Identity"
identityIdentity:output:0*
_input_shapesr
p:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ::::::::::::::2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2X
*dense_3_batch_norm/StatefulPartitionedCall*dense_3_batch_norm/StatefulPartitionedCall2L
$dense_output/StatefulPartitionedCall$dense_output/StatefulPartitionedCall2Z
+searched_embeddings/StatefulPartitionedCall+searched_embeddings/StatefulPartitionedCall2X
*watched_embeddings/StatefulPartitionedCall*watched_embeddings/StatefulPartitionedCall:X T
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:XT
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ü
y
3__inference_searched_embeddings_layer_call_fn_15747

inputs
unknown
identity¢StatefulPartitionedCallþ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *W
fRRP
N__inference_searched_embeddings_layer_call_and_return_conditional_losses_147432
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*3
_input_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
	
Û
B__inference_dense_2_layer_call_and_return_conditional_losses_15104

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@@*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
MatMul
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
BiasAdd/ReadVariableOp
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2	
BiasAdd
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
	
Û
B__inference_dense_2_layer_call_and_return_conditional_losses_16566

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOp
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@@*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
MatMul
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
BiasAdd/ReadVariableOp
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2	
BiasAdd
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
Ë
O
)__inference_l2_norm_1_layer_call_fn_15824

inputs
mask

identityÖ
PartitionedCallPartitionedCallinputsmask*
Tin
2
*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *M
fHRF
D__inference_l2_norm_1_layer_call_and_return_conditional_losses_148112
PartitionedCally
IdentityIdentityPartitionedCall:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*O
_input_shapes>
<:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:\ X
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:VR
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

_user_specified_namemask
Ø
|
'__inference_dense_3_layer_call_fn_16604

inputs
unknown
	unknown_0
identity¢StatefulPartitionedCallò
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_151432
StatefulPartitionedCall
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@::22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
¡


N__inference_searched_embeddings_layer_call_and_return_conditional_losses_14743

inputs
embedding_lookup_14737
identity¢embedding_lookupf
CastCastinputs*

DstT0*

SrcT0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
Cast
embedding_lookupResourceGatherembedding_lookup_14737Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/14737*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
dtype02
embedding_lookupõ
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/14737*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
embedding_lookup/Identity©
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
embedding_lookup/Identity_1
IdentityIdentity$embedding_lookup/Identity_1:output:0^embedding_lookup*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*3
_input_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:2$
embedding_lookupembedding_lookup:X T
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs

H
,__inference_dense_3_relu_layer_call_fn_16614

inputs
identityÅ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *P
fKRI
G__inference_dense_3_relu_layer_call_and_return_conditional_losses_151642
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*&
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
Û
«
@__inference_model_layer_call_and_return_conditional_losses_15591
inputs_0
inputs_1-
)watched_embeddings_embedding_lookup_15509.
*searched_embeddings_embedding_lookup_15517*
&dense_1_matmul_readvariableop_resource+
'dense_1_biasadd_readvariableop_resource*
&dense_2_matmul_readvariableop_resource+
'dense_2_biasadd_readvariableop_resource*
&dense_3_matmul_readvariableop_resource+
'dense_3_biasadd_readvariableop_resource,
(dense_3_batch_norm_assignmovingavg_15559.
*dense_3_batch_norm_assignmovingavg_1_15565<
8dense_3_batch_norm_batchnorm_mul_readvariableop_resource8
4dense_3_batch_norm_batchnorm_readvariableop_resource/
+dense_output_matmul_readvariableop_resource0
,dense_output_biasadd_readvariableop_resource
identity¢dense_1/BiasAdd/ReadVariableOp¢dense_1/MatMul/ReadVariableOp¢dense_2/BiasAdd/ReadVariableOp¢dense_2/MatMul/ReadVariableOp¢dense_3/BiasAdd/ReadVariableOp¢dense_3/MatMul/ReadVariableOp¢6dense_3_batch_norm/AssignMovingAvg/AssignSubVariableOp¢1dense_3_batch_norm/AssignMovingAvg/ReadVariableOp¢8dense_3_batch_norm/AssignMovingAvg_1/AssignSubVariableOp¢3dense_3_batch_norm/AssignMovingAvg_1/ReadVariableOp¢+dense_3_batch_norm/batchnorm/ReadVariableOp¢/dense_3_batch_norm/batchnorm/mul/ReadVariableOp¢#dense_output/BiasAdd/ReadVariableOp¢"dense_output/MatMul/ReadVariableOp¢$searched_embeddings/embedding_lookup¢#watched_embeddings/embedding_lookup
watched_embeddings/CastCastinputs_1*

DstT0*

SrcT0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
watched_embeddings/Castã
#watched_embeddings/embedding_lookupResourceGather)watched_embeddings_embedding_lookup_15509watched_embeddings/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*<
_class2
0.loc:@watched_embeddings/embedding_lookup/15509*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
dtype02%
#watched_embeddings/embedding_lookupÁ
,watched_embeddings/embedding_lookup/IdentityIdentity,watched_embeddings/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*<
_class2
0.loc:@watched_embeddings/embedding_lookup/15509*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2.
,watched_embeddings/embedding_lookup/Identityâ
.watched_embeddings/embedding_lookup/Identity_1Identity5watched_embeddings/embedding_lookup/Identity:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ20
.watched_embeddings/embedding_lookup/Identity_1
watched_embeddings/NotEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2
watched_embeddings/NotEqual/y³
watched_embeddings/NotEqualNotEqualinputs_1&watched_embeddings/NotEqual/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
watched_embeddings/NotEqual
searched_embeddings/CastCastinputs_0*

DstT0*

SrcT0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
searched_embeddings/Castè
$searched_embeddings/embedding_lookupResourceGather*searched_embeddings_embedding_lookup_15517searched_embeddings/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*=
_class3
1/loc:@searched_embeddings/embedding_lookup/15517*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
dtype02&
$searched_embeddings/embedding_lookupÅ
-searched_embeddings/embedding_lookup/IdentityIdentity-searched_embeddings/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*=
_class3
1/loc:@searched_embeddings/embedding_lookup/15517*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2/
-searched_embeddings/embedding_lookup/Identityå
/searched_embeddings/embedding_lookup/Identity_1Identity6searched_embeddings/embedding_lookup/Identity:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ21
/searched_embeddings/embedding_lookup/Identity_1
searched_embeddings/NotEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2 
searched_embeddings/NotEqual/y¶
searched_embeddings/NotEqualNotEqualinputs_0'searched_embeddings/NotEqual/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
searched_embeddings/NotEqual
l2_norm_1/PartitionedCallPartitionedCall7watched_embeddings/embedding_lookup/Identity_1:output:0watched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *
fR
__inference_call_143042
l2_norm_1/PartitionedCall
l2_norm_1/PartitionedCall_1PartitionedCall8searched_embeddings/embedding_lookup/Identity_1:output:0 searched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *
fR
__inference_call_143042
l2_norm_1/PartitionedCall_1ÿ
$aggregate_embeddings/PartitionedCallPartitionedCall$l2_norm_1/PartitionedCall_1:output:0 searched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *
fR
__inference_call_145142&
$aggregate_embeddings/PartitionedCall
&aggregate_embeddings/PartitionedCall_1PartitionedCall"l2_norm_1/PartitionedCall:output:0watched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *
fR
__inference_call_145142(
&aggregate_embeddings/PartitionedCall_1t
concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concatenate/concat/axisñ
concatenate/concatConcatV2-aggregate_embeddings/PartitionedCall:output:0/aggregate_embeddings/PartitionedCall_1:output:0 concatenate/concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 2
concatenate/concat¥
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource*
_output_shapes

: @*
dtype02
dense_1/MatMul/ReadVariableOp 
dense_1/MatMulMatMulconcatenate/concat:output:0%dense_1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_1/MatMul¤
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02 
dense_1/BiasAdd/ReadVariableOp¡
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_1/BiasAddz
dense_1_relu/ReluReludense_1/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_1_relu/Relu¥
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource*
_output_shapes

:@@*
dtype02
dense_2/MatMul/ReadVariableOp¤
dense_2/MatMulMatMuldense_1_relu/Relu:activations:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_2/MatMul¤
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02 
dense_2/BiasAdd/ReadVariableOp¡
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_2/BiasAddz
dense_2_relu/ReluReludense_2/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_2_relu/Relu¥
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource*
_output_shapes

:@@*
dtype02
dense_3/MatMul/ReadVariableOp¤
dense_3/MatMulMatMuldense_2_relu/Relu:activations:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_3/MatMul¤
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02 
dense_3/BiasAdd/ReadVariableOp¡
dense_3/BiasAddBiasAdddense_3/MatMul:product:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_3/BiasAddz
dense_3_relu/ReluReludense_3/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dense_3_relu/Relu°
1dense_3_batch_norm/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 23
1dense_3_batch_norm/moments/mean/reduction_indicesá
dense_3_batch_norm/moments/meanMeandense_3_relu/Relu:activations:0:dense_3_batch_norm/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(2!
dense_3_batch_norm/moments/meanµ
'dense_3_batch_norm/moments/StopGradientStopGradient(dense_3_batch_norm/moments/mean:output:0*
T0*
_output_shapes

:@2)
'dense_3_batch_norm/moments/StopGradientö
,dense_3_batch_norm/moments/SquaredDifferenceSquaredDifferencedense_3_relu/Relu:activations:00dense_3_batch_norm/moments/StopGradient:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2.
,dense_3_batch_norm/moments/SquaredDifference¸
5dense_3_batch_norm/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 27
5dense_3_batch_norm/moments/variance/reduction_indicesþ
#dense_3_batch_norm/moments/varianceMean0dense_3_batch_norm/moments/SquaredDifference:z:0>dense_3_batch_norm/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

:@*
	keep_dims(2%
#dense_3_batch_norm/moments/variance¹
"dense_3_batch_norm/moments/SqueezeSqueeze(dense_3_batch_norm/moments/mean:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 2$
"dense_3_batch_norm/moments/SqueezeÁ
$dense_3_batch_norm/moments/Squeeze_1Squeeze,dense_3_batch_norm/moments/variance:output:0*
T0*
_output_shapes
:@*
squeeze_dims
 2&
$dense_3_batch_norm/moments/Squeeze_1
(dense_3_batch_norm/AssignMovingAvg/decayConst",/job:localhost/replica:0/task:0/device:CPU:0*;
_class1
/-loc:@dense_3_batch_norm/AssignMovingAvg/15559*
_output_shapes
: *
dtype0*
valueB
 *
×#<2*
(dense_3_batch_norm/AssignMovingAvg/decayË
1dense_3_batch_norm/AssignMovingAvg/ReadVariableOpReadVariableOp(dense_3_batch_norm_assignmovingavg_15559*
_output_shapes
:@*
dtype023
1dense_3_batch_norm/AssignMovingAvg/ReadVariableOpÏ
&dense_3_batch_norm/AssignMovingAvg/subSub9dense_3_batch_norm/AssignMovingAvg/ReadVariableOp:value:0+dense_3_batch_norm/moments/Squeeze:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*;
_class1
/-loc:@dense_3_batch_norm/AssignMovingAvg/15559*
_output_shapes
:@2(
&dense_3_batch_norm/AssignMovingAvg/subÆ
&dense_3_batch_norm/AssignMovingAvg/mulMul*dense_3_batch_norm/AssignMovingAvg/sub:z:01dense_3_batch_norm/AssignMovingAvg/decay:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*;
_class1
/-loc:@dense_3_batch_norm/AssignMovingAvg/15559*
_output_shapes
:@2(
&dense_3_batch_norm/AssignMovingAvg/mul
6dense_3_batch_norm/AssignMovingAvg/AssignSubVariableOpAssignSubVariableOp(dense_3_batch_norm_assignmovingavg_15559*dense_3_batch_norm/AssignMovingAvg/mul:z:02^dense_3_batch_norm/AssignMovingAvg/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*;
_class1
/-loc:@dense_3_batch_norm/AssignMovingAvg/15559*
_output_shapes
 *
dtype028
6dense_3_batch_norm/AssignMovingAvg/AssignSubVariableOp
*dense_3_batch_norm/AssignMovingAvg_1/decayConst",/job:localhost/replica:0/task:0/device:CPU:0*=
_class3
1/loc:@dense_3_batch_norm/AssignMovingAvg_1/15565*
_output_shapes
: *
dtype0*
valueB
 *
×#<2,
*dense_3_batch_norm/AssignMovingAvg_1/decayÑ
3dense_3_batch_norm/AssignMovingAvg_1/ReadVariableOpReadVariableOp*dense_3_batch_norm_assignmovingavg_1_15565*
_output_shapes
:@*
dtype025
3dense_3_batch_norm/AssignMovingAvg_1/ReadVariableOpÙ
(dense_3_batch_norm/AssignMovingAvg_1/subSub;dense_3_batch_norm/AssignMovingAvg_1/ReadVariableOp:value:0-dense_3_batch_norm/moments/Squeeze_1:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*=
_class3
1/loc:@dense_3_batch_norm/AssignMovingAvg_1/15565*
_output_shapes
:@2*
(dense_3_batch_norm/AssignMovingAvg_1/subÐ
(dense_3_batch_norm/AssignMovingAvg_1/mulMul,dense_3_batch_norm/AssignMovingAvg_1/sub:z:03dense_3_batch_norm/AssignMovingAvg_1/decay:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*=
_class3
1/loc:@dense_3_batch_norm/AssignMovingAvg_1/15565*
_output_shapes
:@2*
(dense_3_batch_norm/AssignMovingAvg_1/mul«
8dense_3_batch_norm/AssignMovingAvg_1/AssignSubVariableOpAssignSubVariableOp*dense_3_batch_norm_assignmovingavg_1_15565,dense_3_batch_norm/AssignMovingAvg_1/mul:z:04^dense_3_batch_norm/AssignMovingAvg_1/ReadVariableOp",/job:localhost/replica:0/task:0/device:CPU:0*=
_class3
1/loc:@dense_3_batch_norm/AssignMovingAvg_1/15565*
_output_shapes
 *
dtype02:
8dense_3_batch_norm/AssignMovingAvg_1/AssignSubVariableOp
"dense_3_batch_norm/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:2$
"dense_3_batch_norm/batchnorm/add/yÎ
 dense_3_batch_norm/batchnorm/addAddV2-dense_3_batch_norm/moments/Squeeze_1:output:0+dense_3_batch_norm/batchnorm/add/y:output:0*
T0*
_output_shapes
:@2"
 dense_3_batch_norm/batchnorm/add
"dense_3_batch_norm/batchnorm/RsqrtRsqrt$dense_3_batch_norm/batchnorm/add:z:0*
T0*
_output_shapes
:@2$
"dense_3_batch_norm/batchnorm/Rsqrt×
/dense_3_batch_norm/batchnorm/mul/ReadVariableOpReadVariableOp8dense_3_batch_norm_batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype021
/dense_3_batch_norm/batchnorm/mul/ReadVariableOpÑ
 dense_3_batch_norm/batchnorm/mulMul&dense_3_batch_norm/batchnorm/Rsqrt:y:07dense_3_batch_norm/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@2"
 dense_3_batch_norm/batchnorm/mulÈ
"dense_3_batch_norm/batchnorm/mul_1Muldense_3_relu/Relu:activations:0$dense_3_batch_norm/batchnorm/mul:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2$
"dense_3_batch_norm/batchnorm/mul_1Ç
"dense_3_batch_norm/batchnorm/mul_2Mul+dense_3_batch_norm/moments/Squeeze:output:0$dense_3_batch_norm/batchnorm/mul:z:0*
T0*
_output_shapes
:@2$
"dense_3_batch_norm/batchnorm/mul_2Ë
+dense_3_batch_norm/batchnorm/ReadVariableOpReadVariableOp4dense_3_batch_norm_batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype02-
+dense_3_batch_norm/batchnorm/ReadVariableOpÍ
 dense_3_batch_norm/batchnorm/subSub3dense_3_batch_norm/batchnorm/ReadVariableOp:value:0&dense_3_batch_norm/batchnorm/mul_2:z:0*
T0*
_output_shapes
:@2"
 dense_3_batch_norm/batchnorm/subÑ
"dense_3_batch_norm/batchnorm/add_1AddV2&dense_3_batch_norm/batchnorm/mul_1:z:0$dense_3_batch_norm/batchnorm/sub:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2$
"dense_3_batch_norm/batchnorm/add_1µ
"dense_output/MatMul/ReadVariableOpReadVariableOp+dense_output_matmul_readvariableop_resource*
_output_shapes
:	@¬*
dtype02$
"dense_output/MatMul/ReadVariableOp»
dense_output/MatMulMatMul&dense_3_batch_norm/batchnorm/add_1:z:0*dense_output/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2
dense_output/MatMul´
#dense_output/BiasAdd/ReadVariableOpReadVariableOp,dense_output_biasadd_readvariableop_resource*
_output_shapes	
:¬*
dtype02%
#dense_output/BiasAdd/ReadVariableOp¶
dense_output/BiasAddBiasAdddense_output/MatMul:product:0+dense_output/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2
dense_output/BiasAdd
dense_output/SoftmaxSoftmaxdense_output/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2
dense_output/Softmax
IdentityIdentitydense_output/Softmax:softmax:0^dense_1/BiasAdd/ReadVariableOp^dense_1/MatMul/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp^dense_3/MatMul/ReadVariableOp7^dense_3_batch_norm/AssignMovingAvg/AssignSubVariableOp2^dense_3_batch_norm/AssignMovingAvg/ReadVariableOp9^dense_3_batch_norm/AssignMovingAvg_1/AssignSubVariableOp4^dense_3_batch_norm/AssignMovingAvg_1/ReadVariableOp,^dense_3_batch_norm/batchnorm/ReadVariableOp0^dense_3_batch_norm/batchnorm/mul/ReadVariableOp$^dense_output/BiasAdd/ReadVariableOp#^dense_output/MatMul/ReadVariableOp%^searched_embeddings/embedding_lookup$^watched_embeddings/embedding_lookup*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2

Identity"
identityIdentity:output:0*
_input_shapesr
p:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ::::::::::::::2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp2p
6dense_3_batch_norm/AssignMovingAvg/AssignSubVariableOp6dense_3_batch_norm/AssignMovingAvg/AssignSubVariableOp2f
1dense_3_batch_norm/AssignMovingAvg/ReadVariableOp1dense_3_batch_norm/AssignMovingAvg/ReadVariableOp2t
8dense_3_batch_norm/AssignMovingAvg_1/AssignSubVariableOp8dense_3_batch_norm/AssignMovingAvg_1/AssignSubVariableOp2j
3dense_3_batch_norm/AssignMovingAvg_1/ReadVariableOp3dense_3_batch_norm/AssignMovingAvg_1/ReadVariableOp2Z
+dense_3_batch_norm/batchnorm/ReadVariableOp+dense_3_batch_norm/batchnorm/ReadVariableOp2b
/dense_3_batch_norm/batchnorm/mul/ReadVariableOp/dense_3_batch_norm/batchnorm/mul/ReadVariableOp2J
#dense_output/BiasAdd/ReadVariableOp#dense_output/BiasAdd/ReadVariableOp2H
"dense_output/MatMul/ReadVariableOp"dense_output/MatMul/ReadVariableOp2L
$searched_embeddings/embedding_lookup$searched_embeddings/embedding_lookup2J
#watched_embeddings/embedding_lookup#watched_embeddings/embedding_lookup:Z V
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/0:ZV
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
"
_user_specified_name
inputs/1
µ
c
G__inference_dense_1_relu_layer_call_and_return_conditional_losses_15086

inputs
identityN
ReluReluinputs*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
Reluf
IdentityIdentityRelu:activations:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

Identity"
identityIdentity:output:0*&
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:O K
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
 
_user_specified_nameinputs
àç
u
O__inference_aggregate_embeddings_layer_call_and_return_conditional_losses_16140

inputs
mask

identityt
RaggedMask/boolean_mask/ShapeShapeinputs*
T0*
_output_shapes
:2
RaggedMask/boolean_mask/Shape¤
+RaggedMask/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2-
+RaggedMask/boolean_mask/strided_slice/stack¨
-RaggedMask/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_1¨
-RaggedMask/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_2Þ
%RaggedMask/boolean_mask/strided_sliceStridedSlice&RaggedMask/boolean_mask/Shape:output:04RaggedMask/boolean_mask/strided_slice/stack:output:06RaggedMask/boolean_mask/strided_slice/stack_1:output:06RaggedMask/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2'
%RaggedMask/boolean_mask/strided_sliceª
.RaggedMask/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 20
.RaggedMask/boolean_mask/Prod/reduction_indicesÎ
RaggedMask/boolean_mask/ProdProd.RaggedMask/boolean_mask/strided_slice:output:07RaggedMask/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2
RaggedMask/boolean_mask/Prodx
RaggedMask/boolean_mask/Shape_1Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_1¨
-RaggedMask/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2/
-RaggedMask/boolean_mask/strided_slice_1/stack¬
/RaggedMask/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_1/stack_1¬
/RaggedMask/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_1/stack_2ú
'RaggedMask/boolean_mask/strided_slice_1StridedSlice(RaggedMask/boolean_mask/Shape_1:output:06RaggedMask/boolean_mask/strided_slice_1/stack:output:08RaggedMask/boolean_mask/strided_slice_1/stack_1:output:08RaggedMask/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2)
'RaggedMask/boolean_mask/strided_slice_1x
RaggedMask/boolean_mask/Shape_2Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_2¨
-RaggedMask/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice_2/stack¬
/RaggedMask/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_2/stack_1¬
/RaggedMask/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_2/stack_2ú
'RaggedMask/boolean_mask/strided_slice_2StridedSlice(RaggedMask/boolean_mask/Shape_2:output:06RaggedMask/boolean_mask/strided_slice_2/stack:output:08RaggedMask/boolean_mask/strided_slice_2/stack_1:output:08RaggedMask/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
:*
end_mask2)
'RaggedMask/boolean_mask/strided_slice_2¯
'RaggedMask/boolean_mask/concat/values_1Pack%RaggedMask/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2)
'RaggedMask/boolean_mask/concat/values_1
#RaggedMask/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2%
#RaggedMask/boolean_mask/concat/axis¾
RaggedMask/boolean_mask/concatConcatV20RaggedMask/boolean_mask/strided_slice_1:output:00RaggedMask/boolean_mask/concat/values_1:output:00RaggedMask/boolean_mask/strided_slice_2:output:0,RaggedMask/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2 
RaggedMask/boolean_mask/concat°
RaggedMask/boolean_mask/ReshapeReshapeinputs'RaggedMask/boolean_mask/concat:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2!
RaggedMask/boolean_mask/Reshape¥
'RaggedMask/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2)
'RaggedMask/boolean_mask/Reshape_1/shape·
!RaggedMask/boolean_mask/Reshape_1Reshapemask0RaggedMask/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/boolean_mask/Reshape_1
RaggedMask/boolean_mask/WhereWhere*RaggedMask/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/boolean_mask/Where¹
RaggedMask/boolean_mask/SqueezeSqueeze%RaggedMask/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2!
RaggedMask/boolean_mask/Squeeze
%RaggedMask/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2'
%RaggedMask/boolean_mask/GatherV2/axis©
 RaggedMask/boolean_mask/GatherV2GatherV2(RaggedMask/boolean_mask/Reshape:output:0(RaggedMask/boolean_mask/Squeeze:output:0.RaggedMask/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2"
 RaggedMask/boolean_mask/GatherV2
RaggedMask/count_nonzero/zerosConst*
_output_shapes
: *
dtype0
*
value	B
 Z 2 
RaggedMask/count_nonzero/zeros¼
!RaggedMask/count_nonzero/NotEqualNotEqualmask'RaggedMask/count_nonzero/zeros:output:0*
T0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/count_nonzero/NotEqual·
RaggedMask/count_nonzero/CastCast%RaggedMask/count_nonzero/NotEqual:z:0*

DstT0	*

SrcT0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Cast«
.RaggedMask/count_nonzero/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ20
.RaggedMask/count_nonzero/Sum/reduction_indicesÍ
RaggedMask/count_nonzero/SumSum!RaggedMask/count_nonzero/Cast:y:07RaggedMask/count_nonzero/Sum/reduction_indices:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Sum
RaggedMask/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2
RaggedMask/Reshape/shape«
RaggedMask/ReshapeReshape%RaggedMask/count_nonzero/Sum:output:0!RaggedMask/Reshape/shape:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/ReshapeÒ
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis¬
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/CumsumCumsumRaggedMask/Reshape:output:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsumâ
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Const*
_output_shapes
:*
dtype0	*
valueB	R 2L
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Ò
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis¸
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatConcatV2SRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0:output:0GRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum:out:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis:output:0*
N*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatÊ
&RaggedReduceMean/RaggedReduceSum/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:2(
&RaggedReduceMean/RaggedReduceSum/Shape¶
4RaggedReduceMean/RaggedReduceSum/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 26
4RaggedReduceMean/RaggedReduceSum/strided_slice/stackº
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:28
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_1º
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:28
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_2¨
.RaggedReduceMean/RaggedReduceSum/strided_sliceStridedSlice/RaggedReduceMean/RaggedReduceSum/Shape:output:0=RaggedReduceMean/RaggedReduceSum/strided_slice/stack:output:0?RaggedReduceMean/RaggedReduceSum/strided_slice/stack_1:output:0?RaggedReduceMean/RaggedReduceSum/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask20
.RaggedReduceMean/RaggedReduceSum/strided_slice
&RaggedReduceMean/RaggedReduceSum/sub/yConst*
_output_shapes
: *
dtype0*
value	B :2(
&RaggedReduceMean/RaggedReduceSum/sub/yÞ
$RaggedReduceMean/RaggedReduceSum/subSub7RaggedReduceMean/RaggedReduceSum/strided_slice:output:0/RaggedReduceMean/RaggedReduceSum/sub/y:output:0*
T0*
_output_shapes
: 2&
$RaggedReduceMean/RaggedReduceSum/subè
MRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2O
MRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stackì
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_1ì
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_2Å
GRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_sliceStridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_1:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
end_mask2I
GRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_sliceì
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stackù
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_1ð
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Ñ
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1StridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_1:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask2K
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1Ù
=RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/subSubPRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice:output:0RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2?
=RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:*
out_type0	2A
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Shapeõ
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stackð
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_1ð
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_2È
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2StridedSliceHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Shape:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_1:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_2:output:0*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask2K
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2È
ARaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2C
ARaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1/yÊ
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1SubRRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2:output:0JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1/y:output:0*
T0	*
_output_shapes
: 2A
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1Ð
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/startConst*
_output_shapes
: *
dtype0*
value	B : 2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/startÐ
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/delta
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/CastCastNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/start:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2F
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast_1CastNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/delta:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2H
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast_1
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/rangeRangeHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast:y:0CRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1:z:0JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast_1:y:0*

Tidx0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2A
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/CastCastARaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub:z:0*

DstT0*

SrcT0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Cast
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ShapeShapeHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range:output:0*
T0	*
_output_shapes
:2H
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Shapeö
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2V
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackú
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1ú
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2è
NRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_sliceStridedSliceORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Shape:output:0]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2P
NRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice·
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shapePackWRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice:output:0*
N*
T0*
_output_shapes
:2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape
LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastToBroadcastToIRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Cast:y:0[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2N
LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastToÚ
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2H
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ConstÜ
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/MaxMaxURaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Const:output:0*
T0*
_output_shapes
: 2F
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/MaxÚ
JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum/xConst*
_output_shapes
: *
dtype0*
value	B : 2L
JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum/xä
HRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/MaximumMaximumSRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum/x:output:0MRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Max:output:0*
T0*
_output_shapes
: 2J
HRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximumì
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ConstConst*
_output_shapes
: *
dtype0*
value	B : 2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Constð
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1Const*
_output_shapes
: *
dtype0*
value	B :2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1ä
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/RangeRange\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const:output:0LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range
\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ2^
\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dim²
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims
ExpandDimsURaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dim:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Z
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDimsÔ
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/CastCastaRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims:output:0*

DstT0*

SrcT0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast¡
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/LessLess\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range:output:0VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast:y:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Lessä
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimþ
KRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims
ExpandDimsHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dim:output:0*
T0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2M
KRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDimsè
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0Const*
_output_shapes
: *
dtype0*
value	B :2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiplesPackZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0:output:0LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0*
N*
T0*
_output_shapes
:2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/TileTileTRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples:output:0*
T0	*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile¨
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ShapeShapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape
aRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2c
aRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2¢
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_sliceStridedSlice\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape:output:0jRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2]
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice
dRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2f
dRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices¦
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ProdProddRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice:output:0mRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod¬
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1ShapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2¾
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1StridedSlice^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1¬
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2ShapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2¼
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2StridedSlice^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
end_mask2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2Ñ
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1Pack[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1ø
YRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2[
YRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concatConcatV2fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1:output:0fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1:output:0fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2:output:0bRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2V
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ReshapeReshapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape«
WRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1ReshapeVRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Less:z:0fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Y
WRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1¾
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/WhereWhere`RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/WhereÛ
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/SqueezeSqueeze[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeezeü
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2]
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis³
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2GatherV2^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape:output:0^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeeze:output:0dRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2ø
3RaggedReduceMean/RaggedReduceSum/UnsortedSegmentSumUnsortedSegmentSum)RaggedMask/boolean_mask/GatherV2:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2:output:0(RaggedReduceMean/RaggedReduceSum/sub:z:0*
T0*
Tindices0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ25
3RaggedReduceMean/RaggedReduceSum/UnsortedSegmentSum
 RaggedReduceMean/ones_like/ShapeShape)RaggedMask/boolean_mask/GatherV2:output:0*
T0*
_output_shapes
:2"
 RaggedReduceMean/ones_like/Shape
 RaggedReduceMean/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?2"
 RaggedReduceMean/ones_like/ConstÈ
RaggedReduceMean/ones_likeFill)RaggedReduceMean/ones_like/Shape:output:0)RaggedReduceMean/ones_like/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedReduceMean/ones_likeÎ
(RaggedReduceMean/RaggedReduceSum_1/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:2*
(RaggedReduceMean/RaggedReduceSum_1/Shapeº
6RaggedReduceMean/RaggedReduceSum_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 28
6RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack¾
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2:
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_1¾
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2:
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_2´
0RaggedReduceMean/RaggedReduceSum_1/strided_sliceStridedSlice1RaggedReduceMean/RaggedReduceSum_1/Shape:output:0?RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack:output:0ARaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_1:output:0ARaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask22
0RaggedReduceMean/RaggedReduceSum_1/strided_slice
(RaggedReduceMean/RaggedReduceSum_1/sub/yConst*
_output_shapes
: *
dtype0*
value	B :2*
(RaggedReduceMean/RaggedReduceSum_1/sub/yæ
&RaggedReduceMean/RaggedReduceSum_1/subSub9RaggedReduceMean/RaggedReduceSum_1/strided_slice:output:01RaggedReduceMean/RaggedReduceSum_1/sub/y:output:0*
T0*
_output_shapes
: 2(
&RaggedReduceMean/RaggedReduceSum_1/subì
ORaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2Q
ORaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stackð
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_1ð
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_2Ï
IRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_sliceStridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_1:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
end_mask2K
IRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_sliceð
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stacký
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_1ô
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Û
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1StridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_1:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask2M
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1á
?RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/subSubRRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice:output:0TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2A
?RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:*
out_type0	2C
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Shapeù
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stackô
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_1ô
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_2Ô
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2StridedSliceJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Shape:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_1:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_2:output:0*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask2M
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2Ì
CRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2E
CRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1/yÒ
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1SubTRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2:output:0LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1/y:output:0*
T0	*
_output_shapes
: 2C
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1Ô
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/startConst*
_output_shapes
: *
dtype0*
value	B : 2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/startÔ
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/delta
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/CastCastPRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/start:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2H
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast_1CastPRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/delta:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2J
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast_1¡
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/rangeRangeJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast:y:0ERaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1:z:0LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast_1:y:0*

Tidx0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/CastCastCRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub:z:0*

DstT0*

SrcT0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Cast
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ShapeShapeJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range:output:0*
T0	*
_output_shapes
:2J
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Shapeú
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2X
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackþ
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1þ
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2ô
PRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_sliceStridedSliceQRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Shape:output:0_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2R
PRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice½
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shapePackYRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice:output:0*
N*
T0*
_output_shapes
:2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape
NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastToBroadcastToKRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Cast:y:0]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2P
NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastToÞ
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2J
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Constä
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/MaxMaxWRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Const:output:0*
T0*
_output_shapes
: 2H
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/MaxÞ
LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum/xConst*
_output_shapes
: *
dtype0*
value	B : 2N
LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum/xì
JRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/MaximumMaximumURaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum/x:output:0ORaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Max:output:0*
T0*
_output_shapes
: 2L
JRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximumð
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ConstConst*
_output_shapes
: *
dtype0*
value	B : 2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Constô
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1Const*
_output_shapes
: *
dtype0*
value	B :2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1î
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/RangeRange^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const:output:0NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range
^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ2`
^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dimº
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims
ExpandDimsWRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dim:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2\
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDimsÚ
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/CastCastcRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims:output:0*

DstT0*

SrcT0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast©
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/LessLess^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range:output:0XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast:y:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Lessè
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dim
MRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims
ExpandDimsJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dim:output:0*
T0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2O
MRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDimsì
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0Const*
_output_shapes
: *
dtype0*
value	B :2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiplesPack\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0:output:0NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0*
N*
T0*
_output_shapes
:2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/TileTileVRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples:output:0*
T0	*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile®
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ShapeShapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape
cRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2e
cRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2®
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_sliceStridedSlice^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape:output:0lRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2_
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice
fRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2h
fRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices®
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ProdProdfRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice:output:0oRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod²
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1ShapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2Ê
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1StridedSlice`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1²
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2ShapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2È
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2StridedSlice`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
end_mask2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2×
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1Pack]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1ü
[RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2]
[RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concatConcatV2hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1:output:0hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1:output:0hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2:output:0dRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2X
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ReshapeReshapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape³
YRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1ReshapeXRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Less:z:0hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2[
YRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1Ä
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/WhereWherebRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Whereá
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/SqueezeSqueeze]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeeze
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2_
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis½
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2GatherV2`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape:output:0`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeeze:output:0fRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2ú
5RaggedReduceMean/RaggedReduceSum_1/UnsortedSegmentSumUnsortedSegmentSum#RaggedReduceMean/ones_like:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2:output:0*RaggedReduceMean/RaggedReduceSum_1/sub:z:0*
T0*
Tindices0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ27
5RaggedReduceMean/RaggedReduceSum_1/UnsortedSegmentSumï
RaggedReduceMean/truedivRealDiv<RaggedReduceMean/RaggedReduceSum/UnsortedSegmentSum:output:0>RaggedReduceMean/RaggedReduceSum_1/UnsortedSegmentSum:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedReduceMean/truedivp
IdentityIdentityRaggedReduceMean/truediv:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*O
_input_shapes>
<:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:\ X
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:VR
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

_user_specified_namemask
ÜÕ
<
__inference_call_16514

inputs
mask

identityt
RaggedMask/boolean_mask/ShapeShapeinputs*
T0*
_output_shapes
:2
RaggedMask/boolean_mask/Shape¤
+RaggedMask/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2-
+RaggedMask/boolean_mask/strided_slice/stack¨
-RaggedMask/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_1¨
-RaggedMask/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_2Þ
%RaggedMask/boolean_mask/strided_sliceStridedSlice&RaggedMask/boolean_mask/Shape:output:04RaggedMask/boolean_mask/strided_slice/stack:output:06RaggedMask/boolean_mask/strided_slice/stack_1:output:06RaggedMask/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2'
%RaggedMask/boolean_mask/strided_sliceª
.RaggedMask/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 20
.RaggedMask/boolean_mask/Prod/reduction_indicesÎ
RaggedMask/boolean_mask/ProdProd.RaggedMask/boolean_mask/strided_slice:output:07RaggedMask/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2
RaggedMask/boolean_mask/Prodx
RaggedMask/boolean_mask/Shape_1Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_1¨
-RaggedMask/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2/
-RaggedMask/boolean_mask/strided_slice_1/stack¬
/RaggedMask/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_1/stack_1¬
/RaggedMask/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_1/stack_2ú
'RaggedMask/boolean_mask/strided_slice_1StridedSlice(RaggedMask/boolean_mask/Shape_1:output:06RaggedMask/boolean_mask/strided_slice_1/stack:output:08RaggedMask/boolean_mask/strided_slice_1/stack_1:output:08RaggedMask/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2)
'RaggedMask/boolean_mask/strided_slice_1x
RaggedMask/boolean_mask/Shape_2Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_2¨
-RaggedMask/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice_2/stack¬
/RaggedMask/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_2/stack_1¬
/RaggedMask/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_2/stack_2ú
'RaggedMask/boolean_mask/strided_slice_2StridedSlice(RaggedMask/boolean_mask/Shape_2:output:06RaggedMask/boolean_mask/strided_slice_2/stack:output:08RaggedMask/boolean_mask/strided_slice_2/stack_1:output:08RaggedMask/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
:*
end_mask2)
'RaggedMask/boolean_mask/strided_slice_2¯
'RaggedMask/boolean_mask/concat/values_1Pack%RaggedMask/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2)
'RaggedMask/boolean_mask/concat/values_1
#RaggedMask/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2%
#RaggedMask/boolean_mask/concat/axis¾
RaggedMask/boolean_mask/concatConcatV20RaggedMask/boolean_mask/strided_slice_1:output:00RaggedMask/boolean_mask/concat/values_1:output:00RaggedMask/boolean_mask/strided_slice_2:output:0,RaggedMask/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2 
RaggedMask/boolean_mask/concat°
RaggedMask/boolean_mask/ReshapeReshapeinputs'RaggedMask/boolean_mask/concat:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2!
RaggedMask/boolean_mask/Reshape¥
'RaggedMask/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2)
'RaggedMask/boolean_mask/Reshape_1/shape®
!RaggedMask/boolean_mask/Reshape_1Reshapemask0RaggedMask/boolean_mask/Reshape_1/shape:output:0*
T0
*
_output_shapes
:2#
!RaggedMask/boolean_mask/Reshape_1
RaggedMask/boolean_mask/WhereWhere*RaggedMask/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/boolean_mask/Where¹
RaggedMask/boolean_mask/SqueezeSqueeze%RaggedMask/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2!
RaggedMask/boolean_mask/Squeeze
%RaggedMask/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2'
%RaggedMask/boolean_mask/GatherV2/axis©
 RaggedMask/boolean_mask/GatherV2GatherV2(RaggedMask/boolean_mask/Reshape:output:0(RaggedMask/boolean_mask/Squeeze:output:0.RaggedMask/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2"
 RaggedMask/boolean_mask/GatherV2
RaggedMask/count_nonzero/zerosConst*
_output_shapes
: *
dtype0
*
value	B
 Z 2 
RaggedMask/count_nonzero/zerosª
!RaggedMask/count_nonzero/NotEqualNotEqualmask'RaggedMask/count_nonzero/zeros:output:0*
T0
*
_output_shapes

:2#
!RaggedMask/count_nonzero/NotEqual¥
RaggedMask/count_nonzero/CastCast%RaggedMask/count_nonzero/NotEqual:z:0*

DstT0	*

SrcT0
*
_output_shapes

:2
RaggedMask/count_nonzero/Cast«
.RaggedMask/count_nonzero/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ20
.RaggedMask/count_nonzero/Sum/reduction_indicesÄ
RaggedMask/count_nonzero/SumSum!RaggedMask/count_nonzero/Cast:y:07RaggedMask/count_nonzero/Sum/reduction_indices:output:0*
T0	*
_output_shapes
:2
RaggedMask/count_nonzero/Sum
RaggedMask/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2
RaggedMask/Reshape/shape¢
RaggedMask/ReshapeReshape%RaggedMask/count_nonzero/Sum:output:0!RaggedMask/Reshape/shape:output:0*
T0	*
_output_shapes
:2
RaggedMask/ReshapeÒ
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis£
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/CumsumCumsumRaggedMask/Reshape:output:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis:output:0*
T0	*
_output_shapes
:2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsumâ
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Const*
_output_shapes
:*
dtype0	*
valueB	R 2L
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Ò
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis¯
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatConcatV2SRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0:output:0GRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum:out:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis:output:0*
N*
T0	*
_output_shapes
:2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat
&RaggedReduceMean/RaggedReduceSum/ShapeConst*
_output_shapes
:*
dtype0*
valueB:2(
&RaggedReduceMean/RaggedReduceSum/Shape¶
4RaggedReduceMean/RaggedReduceSum/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 26
4RaggedReduceMean/RaggedReduceSum/strided_slice/stackº
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:28
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_1º
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:28
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_2¨
.RaggedReduceMean/RaggedReduceSum/strided_sliceStridedSlice/RaggedReduceMean/RaggedReduceSum/Shape:output:0=RaggedReduceMean/RaggedReduceSum/strided_slice/stack:output:0?RaggedReduceMean/RaggedReduceSum/strided_slice/stack_1:output:0?RaggedReduceMean/RaggedReduceSum/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask20
.RaggedReduceMean/RaggedReduceSum/strided_slice
&RaggedReduceMean/RaggedReduceSum/sub/yConst*
_output_shapes
: *
dtype0*
value	B :2(
&RaggedReduceMean/RaggedReduceSum/sub/yÞ
$RaggedReduceMean/RaggedReduceSum/subSub7RaggedReduceMean/RaggedReduceSum/strided_slice:output:0/RaggedReduceMean/RaggedReduceSum/sub/y:output:0*
T0*
_output_shapes
: 2&
$RaggedReduceMean/RaggedReduceSum/subè
MRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2O
MRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stackì
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_1ì
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_2¼
GRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_sliceStridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_1:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*
end_mask2I
GRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_sliceì
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stackù
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_1ð
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_2È
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1StridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_1:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask2K
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1Ð
=RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/subSubPRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice:output:0RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1:output:0*
T0	*
_output_shapes
:2?
=RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/subÌ
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/ShapeConst*
_output_shapes
:*
dtype0	*
valueB	R2A
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Shapeõ
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stackð
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_1ð
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_2È
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2StridedSliceHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Shape:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_1:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_2:output:0*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask2K
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2È
ARaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2C
ARaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1/yÊ
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1SubRRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2:output:0JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1/y:output:0*
T0	*
_output_shapes
: 2A
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1Ð
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/startConst*
_output_shapes
: *
dtype0*
value	B : 2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/startÐ
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/delta
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/CastCastNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/start:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2F
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast_1CastNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/delta:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2H
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast_1
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/rangeRangeHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast:y:0CRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1:z:0JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast_1:y:0*

Tidx0	*
_output_shapes
:2A
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/CastCastARaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub:z:0*

DstT0*

SrcT0	*
_output_shapes
:2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/CastÚ
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ShapeConst*
_output_shapes
:*
dtype0*
valueB:2H
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Shapeã
NRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Reshape/shapeConst*
_output_shapes
: *
dtype0*
valueB 2P
NRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Reshape/shapeç
PRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Reshape/shape_1Const*
_output_shapes
: *
dtype0*
valueB 2R
PRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Reshape/shape_1æ
HRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ReshapeReshapeIRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Cast:y:0YRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Reshape/shape_1:output:0*
T0*
_output_shapes
: 2J
HRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Reshapeä
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimõ
KRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims
ExpandDimsHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dim:output:0*
T0	*
_output_shapes

:2M
KRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDimsè
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0Const*
_output_shapes
: *
dtype0*
value	B :2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiplesPackZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0:output:0QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Reshape:output:0*
N*
T0*
_output_shapes
:2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiplesø
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/TileTileTRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples:output:0*
T0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tileö
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2V
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackú
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1ú
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2ä
NRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_sliceStridedSliceORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Shape:output:0]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2P
NRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_sliceú
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stackþ
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2Z
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stack_1þ
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2Z
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stack_2ò
PRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_1StridedSliceORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Shape:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stack:output:0aRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stack_1:output:0aRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2R
PRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_1â
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/mulMulQRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Reshape:output:0YRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_1:output:0*
T0*
_output_shapes
: 2F
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/mulú
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stackþ
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2Z
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stack_1þ
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2Z
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stack_2ì
PRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_2StridedSliceORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Shape:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stack:output:0aRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stack_1:output:0aRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
end_mask2R
PRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_2¤
PRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/concat/values_1PackHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/mul:z:0*
N*
T0*
_output_shapes
:2R
PRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/concat/values_1Þ
LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2N
LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/concat/axis²
GRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/concatConcatV2WRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice:output:0YRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/concat/values_1:output:0YRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice_2:output:0URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/concat/axis:output:0*
N*
T0*
_output_shapes
:2I
GRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/concató
JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Reshape_1ReshapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0PRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/concat:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2L
JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Reshape_1ã
3RaggedReduceMean/RaggedReduceSum/UnsortedSegmentSumUnsortedSegmentSum)RaggedMask/boolean_mask/GatherV2:output:0SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Reshape_1:output:0(RaggedReduceMean/RaggedReduceSum/sub:z:0*
T0*
Tindices0	*
_output_shapes

:25
3RaggedReduceMean/RaggedReduceSum/UnsortedSegmentSum
 RaggedReduceMean/ones_like/ShapeShape)RaggedMask/boolean_mask/GatherV2:output:0*
T0*
_output_shapes
:2"
 RaggedReduceMean/ones_like/Shape
 RaggedReduceMean/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?2"
 RaggedReduceMean/ones_like/ConstÈ
RaggedReduceMean/ones_likeFill)RaggedReduceMean/ones_like/Shape:output:0)RaggedReduceMean/ones_like/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedReduceMean/ones_like
(RaggedReduceMean/RaggedReduceSum_1/ShapeConst*
_output_shapes
:*
dtype0*
valueB:2*
(RaggedReduceMean/RaggedReduceSum_1/Shapeº
6RaggedReduceMean/RaggedReduceSum_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 28
6RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack¾
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2:
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_1¾
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2:
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_2´
0RaggedReduceMean/RaggedReduceSum_1/strided_sliceStridedSlice1RaggedReduceMean/RaggedReduceSum_1/Shape:output:0?RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack:output:0ARaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_1:output:0ARaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask22
0RaggedReduceMean/RaggedReduceSum_1/strided_slice
(RaggedReduceMean/RaggedReduceSum_1/sub/yConst*
_output_shapes
: *
dtype0*
value	B :2*
(RaggedReduceMean/RaggedReduceSum_1/sub/yæ
&RaggedReduceMean/RaggedReduceSum_1/subSub9RaggedReduceMean/RaggedReduceSum_1/strided_slice:output:01RaggedReduceMean/RaggedReduceSum_1/sub/y:output:0*
T0*
_output_shapes
: 2(
&RaggedReduceMean/RaggedReduceSum_1/subì
ORaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2Q
ORaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stackð
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_1ð
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_2Æ
IRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_sliceStridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_1:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*
end_mask2K
IRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_sliceð
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stacký
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_1ô
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Ò
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1StridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_1:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_2:output:0*
Index0*
T0	*
_output_shapes
:*

begin_mask2M
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1Ø
?RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/subSubRRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice:output:0TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1:output:0*
T0	*
_output_shapes
:2A
?RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/subÐ
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/ShapeConst*
_output_shapes
:*
dtype0	*
valueB	R2C
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Shapeù
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stackô
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_1ô
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_2Ô
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2StridedSliceJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Shape:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_1:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_2:output:0*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask2M
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2Ì
CRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2E
CRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1/yÒ
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1SubTRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2:output:0LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1/y:output:0*
T0	*
_output_shapes
: 2C
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1Ô
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/startConst*
_output_shapes
: *
dtype0*
value	B : 2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/startÔ
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/delta
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/CastCastPRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/start:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2H
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast_1CastPRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/delta:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2J
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast_1
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/rangeRangeJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast:y:0ERaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1:z:0LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast_1:y:0*

Tidx0	*
_output_shapes
:2C
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/CastCastCRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub:z:0*

DstT0*

SrcT0	*
_output_shapes
:2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/CastÞ
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ShapeConst*
_output_shapes
:*
dtype0*
valueB:2J
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Shapeç
PRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Reshape/shapeConst*
_output_shapes
: *
dtype0*
valueB 2R
PRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Reshape/shapeë
RRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Reshape/shape_1Const*
_output_shapes
: *
dtype0*
valueB 2T
RRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Reshape/shape_1î
JRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ReshapeReshapeKRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Cast:y:0[RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Reshape/shape_1:output:0*
T0*
_output_shapes
: 2L
JRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Reshapeè
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimý
MRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims
ExpandDimsJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dim:output:0*
T0	*
_output_shapes

:2O
MRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDimsì
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0Const*
_output_shapes
: *
dtype0*
value	B :2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiplesPack\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0:output:0SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Reshape:output:0*
N*
T0*
_output_shapes
:2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/TileTileVRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples:output:0*
T0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tileú
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2X
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackþ
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1þ
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2ð
PRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_sliceStridedSliceQRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Shape:output:0_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2R
PRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_sliceþ
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stack
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2\
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stack_1
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2\
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stack_2þ
RRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_1StridedSliceQRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Shape:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stack:output:0cRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stack_1:output:0cRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2T
RRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_1ê
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/mulMulSRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Reshape:output:0[RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_1:output:0*
T0*
_output_shapes
: 2H
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/mulþ
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stack
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2\
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stack_1
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2\
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stack_2ø
RRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_2StridedSliceQRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Shape:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stack:output:0cRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stack_1:output:0cRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
end_mask2T
RRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_2ª
RRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/concat/values_1PackJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/mul:z:0*
N*
T0*
_output_shapes
:2T
RRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/concat/values_1â
NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2P
NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/concat/axis¾
IRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/concatConcatV2YRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice:output:0[RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/concat/values_1:output:0[RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice_2:output:0WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/concat/axis:output:0*
N*
T0*
_output_shapes
:2K
IRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/concatû
LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Reshape_1ReshapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0RRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/concat:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2N
LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Reshape_1å
5RaggedReduceMean/RaggedReduceSum_1/UnsortedSegmentSumUnsortedSegmentSum#RaggedReduceMean/ones_like:output:0URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Reshape_1:output:0*RaggedReduceMean/RaggedReduceSum_1/sub:z:0*
T0*
Tindices0	*
_output_shapes

:27
5RaggedReduceMean/RaggedReduceSum_1/UnsortedSegmentSumæ
RaggedReduceMean/truedivRealDiv<RaggedReduceMean/RaggedReduceSum/UnsortedSegmentSum:output:0>RaggedReduceMean/RaggedReduceSum_1/UnsortedSegmentSum:output:0*
T0*
_output_shapes

:2
RaggedReduceMean/truedivg
IdentityIdentityRaggedReduceMean/truediv:z:0*
T0*
_output_shapes

:2

Identity"
identityIdentity:output:0*4
_input_shapes#
!:ÿÿÿÿÿÿÿÿÿ::S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:D@

_output_shapes

:

_user_specified_namemask
w
Ø
 __inference__wrapped_model_14564
search_query
watch_history3
/model_watched_embeddings_embedding_lookup_142364
0model_searched_embeddings_embedding_lookup_142440
,model_dense_1_matmul_readvariableop_resource1
-model_dense_1_biasadd_readvariableop_resource0
,model_dense_2_matmul_readvariableop_resource1
-model_dense_2_biasadd_readvariableop_resource0
,model_dense_3_matmul_readvariableop_resource1
-model_dense_3_biasadd_readvariableop_resource>
:model_dense_3_batch_norm_batchnorm_readvariableop_resourceB
>model_dense_3_batch_norm_batchnorm_mul_readvariableop_resource@
<model_dense_3_batch_norm_batchnorm_readvariableop_1_resource@
<model_dense_3_batch_norm_batchnorm_readvariableop_2_resource5
1model_dense_output_matmul_readvariableop_resource6
2model_dense_output_biasadd_readvariableop_resource
identity¢$model/dense_1/BiasAdd/ReadVariableOp¢#model/dense_1/MatMul/ReadVariableOp¢$model/dense_2/BiasAdd/ReadVariableOp¢#model/dense_2/MatMul/ReadVariableOp¢$model/dense_3/BiasAdd/ReadVariableOp¢#model/dense_3/MatMul/ReadVariableOp¢1model/dense_3_batch_norm/batchnorm/ReadVariableOp¢3model/dense_3_batch_norm/batchnorm/ReadVariableOp_1¢3model/dense_3_batch_norm/batchnorm/ReadVariableOp_2¢5model/dense_3_batch_norm/batchnorm/mul/ReadVariableOp¢)model/dense_output/BiasAdd/ReadVariableOp¢(model/dense_output/MatMul/ReadVariableOp¢*model/searched_embeddings/embedding_lookup¢)model/watched_embeddings/embedding_lookup
model/watched_embeddings/CastCastwatch_history*

DstT0*

SrcT0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
model/watched_embeddings/Cast
)model/watched_embeddings/embedding_lookupResourceGather/model_watched_embeddings_embedding_lookup_14236!model/watched_embeddings/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*B
_class8
64loc:@model/watched_embeddings/embedding_lookup/14236*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
dtype02+
)model/watched_embeddings/embedding_lookupÙ
2model/watched_embeddings/embedding_lookup/IdentityIdentity2model/watched_embeddings/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*B
_class8
64loc:@model/watched_embeddings/embedding_lookup/14236*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ24
2model/watched_embeddings/embedding_lookup/Identityô
4model/watched_embeddings/embedding_lookup/Identity_1Identity;model/watched_embeddings/embedding_lookup/Identity:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ26
4model/watched_embeddings/embedding_lookup/Identity_1
#model/watched_embeddings/NotEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2%
#model/watched_embeddings/NotEqual/yÊ
!model/watched_embeddings/NotEqualNotEqualwatch_history,model/watched_embeddings/NotEqual/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2#
!model/watched_embeddings/NotEqual 
model/searched_embeddings/CastCastsearch_query*

DstT0*

SrcT0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2 
model/searched_embeddings/Cast
*model/searched_embeddings/embedding_lookupResourceGather0model_searched_embeddings_embedding_lookup_14244"model/searched_embeddings/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*C
_class9
75loc:@model/searched_embeddings/embedding_lookup/14244*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ*
dtype02,
*model/searched_embeddings/embedding_lookupÝ
3model/searched_embeddings/embedding_lookup/IdentityIdentity3model/searched_embeddings/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*C
_class9
75loc:@model/searched_embeddings/embedding_lookup/14244*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ25
3model/searched_embeddings/embedding_lookup/Identity÷
5model/searched_embeddings/embedding_lookup/Identity_1Identity<model/searched_embeddings/embedding_lookup/Identity:output:0*
T0*4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ27
5model/searched_embeddings/embedding_lookup/Identity_1
$model/searched_embeddings/NotEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *    2&
$model/searched_embeddings/NotEqual/yÌ
"model/searched_embeddings/NotEqualNotEqualsearch_query-model/searched_embeddings/NotEqual/y:output:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2$
"model/searched_embeddings/NotEqual 
model/l2_norm_1/PartitionedCallPartitionedCall=model/watched_embeddings/embedding_lookup/Identity_1:output:0%model/watched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *
fR
__inference_call_143042!
model/l2_norm_1/PartitionedCall¦
!model/l2_norm_1/PartitionedCall_1PartitionedCall>model/searched_embeddings/embedding_lookup/Identity_1:output:0&model/searched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *
fR
__inference_call_143042#
!model/l2_norm_1/PartitionedCall_1
*model/aggregate_embeddings/PartitionedCallPartitionedCall*model/l2_norm_1/PartitionedCall_1:output:0&model/searched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *
fR
__inference_call_145142,
*model/aggregate_embeddings/PartitionedCall
,model/aggregate_embeddings/PartitionedCall_1PartitionedCall(model/l2_norm_1/PartitionedCall:output:0%model/watched_embeddings/NotEqual:z:0*
Tin
2
*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *
fR
__inference_call_145142.
,model/aggregate_embeddings/PartitionedCall_1
model/concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
model/concatenate/concat/axis
model/concatenate/concatConcatV23model/aggregate_embeddings/PartitionedCall:output:05model/aggregate_embeddings/PartitionedCall_1:output:0&model/concatenate/concat/axis:output:0*
N*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 2
model/concatenate/concat·
#model/dense_1/MatMul/ReadVariableOpReadVariableOp,model_dense_1_matmul_readvariableop_resource*
_output_shapes

: @*
dtype02%
#model/dense_1/MatMul/ReadVariableOp¸
model/dense_1/MatMulMatMul!model/concatenate/concat:output:0+model/dense_1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
model/dense_1/MatMul¶
$model/dense_1/BiasAdd/ReadVariableOpReadVariableOp-model_dense_1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02&
$model/dense_1/BiasAdd/ReadVariableOp¹
model/dense_1/BiasAddBiasAddmodel/dense_1/MatMul:product:0,model/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
model/dense_1/BiasAdd
model/dense_1_relu/ReluRelumodel/dense_1/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
model/dense_1_relu/Relu·
#model/dense_2/MatMul/ReadVariableOpReadVariableOp,model_dense_2_matmul_readvariableop_resource*
_output_shapes

:@@*
dtype02%
#model/dense_2/MatMul/ReadVariableOp¼
model/dense_2/MatMulMatMul%model/dense_1_relu/Relu:activations:0+model/dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
model/dense_2/MatMul¶
$model/dense_2/BiasAdd/ReadVariableOpReadVariableOp-model_dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02&
$model/dense_2/BiasAdd/ReadVariableOp¹
model/dense_2/BiasAddBiasAddmodel/dense_2/MatMul:product:0,model/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
model/dense_2/BiasAdd
model/dense_2_relu/ReluRelumodel/dense_2/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
model/dense_2_relu/Relu·
#model/dense_3/MatMul/ReadVariableOpReadVariableOp,model_dense_3_matmul_readvariableop_resource*
_output_shapes

:@@*
dtype02%
#model/dense_3/MatMul/ReadVariableOp¼
model/dense_3/MatMulMatMul%model/dense_2_relu/Relu:activations:0+model/dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
model/dense_3/MatMul¶
$model/dense_3/BiasAdd/ReadVariableOpReadVariableOp-model_dense_3_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02&
$model/dense_3/BiasAdd/ReadVariableOp¹
model/dense_3/BiasAddBiasAddmodel/dense_3/MatMul:product:0,model/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
model/dense_3/BiasAdd
model/dense_3_relu/ReluRelumodel/dense_3/BiasAdd:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
model/dense_3_relu/ReluÝ
1model/dense_3_batch_norm/batchnorm/ReadVariableOpReadVariableOp:model_dense_3_batch_norm_batchnorm_readvariableop_resource*
_output_shapes
:@*
dtype023
1model/dense_3_batch_norm/batchnorm/ReadVariableOp
(model/dense_3_batch_norm/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o:2*
(model/dense_3_batch_norm/batchnorm/add/yì
&model/dense_3_batch_norm/batchnorm/addAddV29model/dense_3_batch_norm/batchnorm/ReadVariableOp:value:01model/dense_3_batch_norm/batchnorm/add/y:output:0*
T0*
_output_shapes
:@2(
&model/dense_3_batch_norm/batchnorm/add®
(model/dense_3_batch_norm/batchnorm/RsqrtRsqrt*model/dense_3_batch_norm/batchnorm/add:z:0*
T0*
_output_shapes
:@2*
(model/dense_3_batch_norm/batchnorm/Rsqrté
5model/dense_3_batch_norm/batchnorm/mul/ReadVariableOpReadVariableOp>model_dense_3_batch_norm_batchnorm_mul_readvariableop_resource*
_output_shapes
:@*
dtype027
5model/dense_3_batch_norm/batchnorm/mul/ReadVariableOpé
&model/dense_3_batch_norm/batchnorm/mulMul,model/dense_3_batch_norm/batchnorm/Rsqrt:y:0=model/dense_3_batch_norm/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
:@2(
&model/dense_3_batch_norm/batchnorm/mulà
(model/dense_3_batch_norm/batchnorm/mul_1Mul%model/dense_3_relu/Relu:activations:0*model/dense_3_batch_norm/batchnorm/mul:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2*
(model/dense_3_batch_norm/batchnorm/mul_1ã
3model/dense_3_batch_norm/batchnorm/ReadVariableOp_1ReadVariableOp<model_dense_3_batch_norm_batchnorm_readvariableop_1_resource*
_output_shapes
:@*
dtype025
3model/dense_3_batch_norm/batchnorm/ReadVariableOp_1é
(model/dense_3_batch_norm/batchnorm/mul_2Mul;model/dense_3_batch_norm/batchnorm/ReadVariableOp_1:value:0*model/dense_3_batch_norm/batchnorm/mul:z:0*
T0*
_output_shapes
:@2*
(model/dense_3_batch_norm/batchnorm/mul_2ã
3model/dense_3_batch_norm/batchnorm/ReadVariableOp_2ReadVariableOp<model_dense_3_batch_norm_batchnorm_readvariableop_2_resource*
_output_shapes
:@*
dtype025
3model/dense_3_batch_norm/batchnorm/ReadVariableOp_2ç
&model/dense_3_batch_norm/batchnorm/subSub;model/dense_3_batch_norm/batchnorm/ReadVariableOp_2:value:0,model/dense_3_batch_norm/batchnorm/mul_2:z:0*
T0*
_output_shapes
:@2(
&model/dense_3_batch_norm/batchnorm/subé
(model/dense_3_batch_norm/batchnorm/add_1AddV2,model/dense_3_batch_norm/batchnorm/mul_1:z:0*model/dense_3_batch_norm/batchnorm/sub:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2*
(model/dense_3_batch_norm/batchnorm/add_1Ç
(model/dense_output/MatMul/ReadVariableOpReadVariableOp1model_dense_output_matmul_readvariableop_resource*
_output_shapes
:	@¬*
dtype02*
(model/dense_output/MatMul/ReadVariableOpÓ
model/dense_output/MatMulMatMul,model/dense_3_batch_norm/batchnorm/add_1:z:00model/dense_output/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2
model/dense_output/MatMulÆ
)model/dense_output/BiasAdd/ReadVariableOpReadVariableOp2model_dense_output_biasadd_readvariableop_resource*
_output_shapes	
:¬*
dtype02+
)model/dense_output/BiasAdd/ReadVariableOpÎ
model/dense_output/BiasAddBiasAdd#model/dense_output/MatMul:product:01model/dense_output/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2
model/dense_output/BiasAdd
model/dense_output/SoftmaxSoftmax#model/dense_output/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2
model/dense_output/Softmaxè
IdentityIdentity$model/dense_output/Softmax:softmax:0%^model/dense_1/BiasAdd/ReadVariableOp$^model/dense_1/MatMul/ReadVariableOp%^model/dense_2/BiasAdd/ReadVariableOp$^model/dense_2/MatMul/ReadVariableOp%^model/dense_3/BiasAdd/ReadVariableOp$^model/dense_3/MatMul/ReadVariableOp2^model/dense_3_batch_norm/batchnorm/ReadVariableOp4^model/dense_3_batch_norm/batchnorm/ReadVariableOp_14^model/dense_3_batch_norm/batchnorm/ReadVariableOp_26^model/dense_3_batch_norm/batchnorm/mul/ReadVariableOp*^model/dense_output/BiasAdd/ReadVariableOp)^model/dense_output/MatMul/ReadVariableOp+^model/searched_embeddings/embedding_lookup*^model/watched_embeddings/embedding_lookup*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¬2

Identity"
identityIdentity:output:0*
_input_shapesr
p:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ::::::::::::::2L
$model/dense_1/BiasAdd/ReadVariableOp$model/dense_1/BiasAdd/ReadVariableOp2J
#model/dense_1/MatMul/ReadVariableOp#model/dense_1/MatMul/ReadVariableOp2L
$model/dense_2/BiasAdd/ReadVariableOp$model/dense_2/BiasAdd/ReadVariableOp2J
#model/dense_2/MatMul/ReadVariableOp#model/dense_2/MatMul/ReadVariableOp2L
$model/dense_3/BiasAdd/ReadVariableOp$model/dense_3/BiasAdd/ReadVariableOp2J
#model/dense_3/MatMul/ReadVariableOp#model/dense_3/MatMul/ReadVariableOp2f
1model/dense_3_batch_norm/batchnorm/ReadVariableOp1model/dense_3_batch_norm/batchnorm/ReadVariableOp2j
3model/dense_3_batch_norm/batchnorm/ReadVariableOp_13model/dense_3_batch_norm/batchnorm/ReadVariableOp_12j
3model/dense_3_batch_norm/batchnorm/ReadVariableOp_23model/dense_3_batch_norm/batchnorm/ReadVariableOp_22n
5model/dense_3_batch_norm/batchnorm/mul/ReadVariableOp5model/dense_3_batch_norm/batchnorm/mul/ReadVariableOp2V
)model/dense_output/BiasAdd/ReadVariableOp)model/dense_output/BiasAdd/ReadVariableOp2T
(model/dense_output/MatMul/ReadVariableOp(model/dense_output/MatMul/ReadVariableOp2X
*model/searched_embeddings/embedding_lookup*model/searched_embeddings/embedding_lookup2V
)model/watched_embeddings/embedding_lookup)model/watched_embeddings/embedding_lookup:^ Z
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
&
_user_specified_namesearch_query:_[
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
'
_user_specified_namewatch_history
§ç
<
__inference_call_16354

inputs
mask

identityt
RaggedMask/boolean_mask/ShapeShapeinputs*
T0*
_output_shapes
:2
RaggedMask/boolean_mask/Shape¤
+RaggedMask/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2-
+RaggedMask/boolean_mask/strided_slice/stack¨
-RaggedMask/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_1¨
-RaggedMask/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice/stack_2Þ
%RaggedMask/boolean_mask/strided_sliceStridedSlice&RaggedMask/boolean_mask/Shape:output:04RaggedMask/boolean_mask/strided_slice/stack:output:06RaggedMask/boolean_mask/strided_slice/stack_1:output:06RaggedMask/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2'
%RaggedMask/boolean_mask/strided_sliceª
.RaggedMask/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 20
.RaggedMask/boolean_mask/Prod/reduction_indicesÎ
RaggedMask/boolean_mask/ProdProd.RaggedMask/boolean_mask/strided_slice:output:07RaggedMask/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2
RaggedMask/boolean_mask/Prodx
RaggedMask/boolean_mask/Shape_1Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_1¨
-RaggedMask/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2/
-RaggedMask/boolean_mask/strided_slice_1/stack¬
/RaggedMask/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_1/stack_1¬
/RaggedMask/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_1/stack_2ú
'RaggedMask/boolean_mask/strided_slice_1StridedSlice(RaggedMask/boolean_mask/Shape_1:output:06RaggedMask/boolean_mask/strided_slice_1/stack:output:08RaggedMask/boolean_mask/strided_slice_1/stack_1:output:08RaggedMask/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2)
'RaggedMask/boolean_mask/strided_slice_1x
RaggedMask/boolean_mask/Shape_2Shapeinputs*
T0*
_output_shapes
:2!
RaggedMask/boolean_mask/Shape_2¨
-RaggedMask/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2/
-RaggedMask/boolean_mask/strided_slice_2/stack¬
/RaggedMask/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 21
/RaggedMask/boolean_mask/strided_slice_2/stack_1¬
/RaggedMask/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:21
/RaggedMask/boolean_mask/strided_slice_2/stack_2ú
'RaggedMask/boolean_mask/strided_slice_2StridedSlice(RaggedMask/boolean_mask/Shape_2:output:06RaggedMask/boolean_mask/strided_slice_2/stack:output:08RaggedMask/boolean_mask/strided_slice_2/stack_1:output:08RaggedMask/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
:*
end_mask2)
'RaggedMask/boolean_mask/strided_slice_2¯
'RaggedMask/boolean_mask/concat/values_1Pack%RaggedMask/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2)
'RaggedMask/boolean_mask/concat/values_1
#RaggedMask/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2%
#RaggedMask/boolean_mask/concat/axis¾
RaggedMask/boolean_mask/concatConcatV20RaggedMask/boolean_mask/strided_slice_1:output:00RaggedMask/boolean_mask/concat/values_1:output:00RaggedMask/boolean_mask/strided_slice_2:output:0,RaggedMask/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2 
RaggedMask/boolean_mask/concat°
RaggedMask/boolean_mask/ReshapeReshapeinputs'RaggedMask/boolean_mask/concat:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2!
RaggedMask/boolean_mask/Reshape¥
'RaggedMask/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2)
'RaggedMask/boolean_mask/Reshape_1/shape·
!RaggedMask/boolean_mask/Reshape_1Reshapemask0RaggedMask/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/boolean_mask/Reshape_1
RaggedMask/boolean_mask/WhereWhere*RaggedMask/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/boolean_mask/Where¹
RaggedMask/boolean_mask/SqueezeSqueeze%RaggedMask/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2!
RaggedMask/boolean_mask/Squeeze
%RaggedMask/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2'
%RaggedMask/boolean_mask/GatherV2/axis©
 RaggedMask/boolean_mask/GatherV2GatherV2(RaggedMask/boolean_mask/Reshape:output:0(RaggedMask/boolean_mask/Squeeze:output:0.RaggedMask/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2"
 RaggedMask/boolean_mask/GatherV2
RaggedMask/count_nonzero/zerosConst*
_output_shapes
: *
dtype0
*
value	B
 Z 2 
RaggedMask/count_nonzero/zeros¼
!RaggedMask/count_nonzero/NotEqualNotEqualmask'RaggedMask/count_nonzero/zeros:output:0*
T0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2#
!RaggedMask/count_nonzero/NotEqual·
RaggedMask/count_nonzero/CastCast%RaggedMask/count_nonzero/NotEqual:z:0*

DstT0	*

SrcT0
*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Cast«
.RaggedMask/count_nonzero/Sum/reduction_indicesConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ20
.RaggedMask/count_nonzero/Sum/reduction_indicesÍ
RaggedMask/count_nonzero/SumSum!RaggedMask/count_nonzero/Cast:y:07RaggedMask/count_nonzero/Sum/reduction_indices:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/count_nonzero/Sum
RaggedMask/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2
RaggedMask/Reshape/shape«
RaggedMask/ReshapeReshape%RaggedMask/count_nonzero/Sum:output:0!RaggedMask/Reshape/shape:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedMask/ReshapeÒ
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis¬
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/CumsumCumsumRaggedMask/Reshape:output:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum/axis:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsumâ
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Const*
_output_shapes
:*
dtype0	*
valueB	R 2L
JRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0Ò
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2H
FRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis¸
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatConcatV2SRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/values_0:output:0GRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/Cumsum:out:0ORaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat/axis:output:0*
N*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concatÊ
&RaggedReduceMean/RaggedReduceSum/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:2(
&RaggedReduceMean/RaggedReduceSum/Shape¶
4RaggedReduceMean/RaggedReduceSum/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 26
4RaggedReduceMean/RaggedReduceSum/strided_slice/stackº
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:28
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_1º
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:28
6RaggedReduceMean/RaggedReduceSum/strided_slice/stack_2¨
.RaggedReduceMean/RaggedReduceSum/strided_sliceStridedSlice/RaggedReduceMean/RaggedReduceSum/Shape:output:0=RaggedReduceMean/RaggedReduceSum/strided_slice/stack:output:0?RaggedReduceMean/RaggedReduceSum/strided_slice/stack_1:output:0?RaggedReduceMean/RaggedReduceSum/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask20
.RaggedReduceMean/RaggedReduceSum/strided_slice
&RaggedReduceMean/RaggedReduceSum/sub/yConst*
_output_shapes
: *
dtype0*
value	B :2(
&RaggedReduceMean/RaggedReduceSum/sub/yÞ
$RaggedReduceMean/RaggedReduceSum/subSub7RaggedReduceMean/RaggedReduceSum/strided_slice:output:0/RaggedReduceMean/RaggedReduceSum/sub/y:output:0*
T0*
_output_shapes
: 2&
$RaggedReduceMean/RaggedReduceSum/subè
MRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2O
MRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stackì
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_1ì
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_2Å
GRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_sliceStridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_1:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
end_mask2I
GRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_sliceì
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stackù
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_1ð
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Ñ
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1StridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_1:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask2K
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1Ù
=RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/subSubPRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice:output:0RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_1:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2?
=RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:*
out_type0	2A
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Shapeõ
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stackð
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_1ð
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_2È
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2StridedSliceHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Shape:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_1:output:0ZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2/stack_2:output:0*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask2K
IRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2È
ARaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2C
ARaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1/yÊ
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1SubRRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/strided_slice_2:output:0JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1/y:output:0*
T0	*
_output_shapes
: 2A
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1Ð
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/startConst*
_output_shapes
: *
dtype0*
value	B : 2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/startÐ
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/delta
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/CastCastNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/start:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2F
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast_1CastNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/delta:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2H
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast_1
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/rangeRangeHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast:y:0CRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub_1:z:0JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range/Cast_1:y:0*

Tidx0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2A
?RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/CastCastARaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/sub:z:0*

DstT0*

SrcT0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Cast
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ShapeShapeHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range:output:0*
T0	*
_output_shapes
:2H
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Shapeö
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2V
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackú
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1ú
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2è
NRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_sliceStridedSliceORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Shape:output:0]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2P
NRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice·
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shapePackWRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/strided_slice:output:0*
N*
T0*
_output_shapes
:2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape
LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastToBroadcastToIRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Cast:y:0[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2N
LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastToÚ
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2H
FRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ConstÜ
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/MaxMaxURaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Const:output:0*
T0*
_output_shapes
: 2F
DRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/MaxÚ
JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum/xConst*
_output_shapes
: *
dtype0*
value	B : 2L
JRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum/xä
HRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/MaximumMaximumSRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum/x:output:0MRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Max:output:0*
T0*
_output_shapes
: 2J
HRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximumì
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ConstConst*
_output_shapes
: *
dtype0*
value	B : 2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Constð
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1Const*
_output_shapes
: *
dtype0*
value	B :2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1ä
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/RangeRange\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const:output:0LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range
\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ2^
\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dim²
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims
ExpandDimsURaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dim:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Z
XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDimsÔ
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/CastCastaRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims:output:0*

DstT0*

SrcT0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast¡
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/LessLess\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range:output:0VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast:y:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Lessä
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimþ
KRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims
ExpandDimsHRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/range:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dim:output:0*
T0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2M
KRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDimsè
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0Const*
_output_shapes
: *
dtype0*
value	B :2S
QRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiplesPackZRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0:output:0LRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0*
N*
T0*
_output_shapes
:2Q
ORaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/TileTileTRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/ExpandDims:output:0XRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile/multiples:output:0*
T0	*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2G
ERaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile¨
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ShapeShapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape
aRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2c
aRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2¢
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_sliceStridedSlice\RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape:output:0jRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2]
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice
dRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2f
dRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices¦
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ProdProddRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice:output:0mRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2T
RRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod¬
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1ShapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2¾
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1StridedSlice^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1¬
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2ShapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2e
cRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2¼
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2StridedSlice^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2:output:0lRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1:output:0nRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
end_mask2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2Ñ
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1Pack[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1ø
YRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2[
YRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concatConcatV2fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1:output:0fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1:output:0fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2:output:0bRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2V
TRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ReshapeReshapeNRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/Tile:output:0]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2_
]RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape«
WRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1ReshapeVRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Less:z:0fRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Y
WRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1¾
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/WhereWhere`RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2U
SRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/WhereÛ
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/SqueezeSqueeze[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2W
URaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeezeü
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2]
[RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis³
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2GatherV2^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape:output:0^RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeeze:output:0dRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2X
VRaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2ø
3RaggedReduceMean/RaggedReduceSum/UnsortedSegmentSumUnsortedSegmentSum)RaggedMask/boolean_mask/GatherV2:output:0_RaggedReduceMean/RaggedReduceSum/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2:output:0(RaggedReduceMean/RaggedReduceSum/sub:z:0*
T0*
Tindices0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ25
3RaggedReduceMean/RaggedReduceSum/UnsortedSegmentSum
 RaggedReduceMean/ones_like/ShapeShape)RaggedMask/boolean_mask/GatherV2:output:0*
T0*
_output_shapes
:2"
 RaggedReduceMean/ones_like/Shape
 RaggedReduceMean/ones_like/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  ?2"
 RaggedReduceMean/ones_like/ConstÈ
RaggedReduceMean/ones_likeFill)RaggedReduceMean/ones_like/Shape:output:0)RaggedReduceMean/ones_like/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedReduceMean/ones_likeÎ
(RaggedReduceMean/RaggedReduceSum_1/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:2*
(RaggedReduceMean/RaggedReduceSum_1/Shapeº
6RaggedReduceMean/RaggedReduceSum_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 28
6RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack¾
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2:
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_1¾
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2:
8RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_2´
0RaggedReduceMean/RaggedReduceSum_1/strided_sliceStridedSlice1RaggedReduceMean/RaggedReduceSum_1/Shape:output:0?RaggedReduceMean/RaggedReduceSum_1/strided_slice/stack:output:0ARaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_1:output:0ARaggedReduceMean/RaggedReduceSum_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask22
0RaggedReduceMean/RaggedReduceSum_1/strided_slice
(RaggedReduceMean/RaggedReduceSum_1/sub/yConst*
_output_shapes
: *
dtype0*
value	B :2*
(RaggedReduceMean/RaggedReduceSum_1/sub/yæ
&RaggedReduceMean/RaggedReduceSum_1/subSub9RaggedReduceMean/RaggedReduceSum_1/strided_slice:output:01RaggedReduceMean/RaggedReduceSum_1/sub/y:output:0*
T0*
_output_shapes
: 2(
&RaggedReduceMean/RaggedReduceSum_1/subì
ORaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:2Q
ORaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stackð
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_1ð
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_2Ï
IRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_sliceStridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_1:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
end_mask2K
IRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_sliceð
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stacký
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_1ô
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_2Û
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1StridedSliceJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_1:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*

begin_mask2M
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1á
?RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/subSubRRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice:output:0TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_1:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2A
?RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/ShapeShapeJRaggedMask/RaggedFromRowLengths/RowPartitionFromRowLengths/concat:output:0*
T0	*
_output_shapes
:*
out_type0	2C
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Shapeù
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stackô
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_1ô
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_2Ô
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2StridedSliceJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Shape:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_1:output:0\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2/stack_2:output:0*
Index0*
T0	*
_output_shapes
: *
shrink_axis_mask2M
KRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2Ì
CRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1/yConst*
_output_shapes
: *
dtype0	*
value	B	 R2E
CRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1/yÒ
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1SubTRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/strided_slice_2:output:0LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1/y:output:0*
T0	*
_output_shapes
: 2C
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1Ô
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/startConst*
_output_shapes
: *
dtype0*
value	B : 2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/startÔ
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/delta
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/CastCastPRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/start:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2H
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast_1CastPRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/delta:output:0*

DstT0	*

SrcT0*
_output_shapes
: 2J
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast_1¡
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/rangeRangeJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast:y:0ERaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub_1:z:0LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range/Cast_1:y:0*

Tidx0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2C
ARaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/CastCastCRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/sub:z:0*

DstT0*

SrcT0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Cast
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ShapeShapeJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range:output:0*
T0	*
_output_shapes
:2J
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Shapeú
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2X
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stackþ
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1þ
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2ô
PRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_sliceStridedSliceQRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Shape:output:0_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_1:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2R
PRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice½
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shapePackYRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/strided_slice:output:0*
N*
T0*
_output_shapes
:2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape
NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastToBroadcastToKRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Cast:y:0]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo/shape:output:0*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2P
NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastToÞ
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2J
HRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Constä
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/MaxMaxWRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Const:output:0*
T0*
_output_shapes
: 2H
FRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/MaxÞ
LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum/xConst*
_output_shapes
: *
dtype0*
value	B : 2N
LRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum/xì
JRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/MaximumMaximumURaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum/x:output:0ORaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Max:output:0*
T0*
_output_shapes
: 2L
JRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximumð
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ConstConst*
_output_shapes
: *
dtype0*
value	B : 2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Constô
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1Const*
_output_shapes
: *
dtype0*
value	B :2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1î
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/RangeRange^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const:output:0NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Const_1:output:0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range
^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
ÿÿÿÿÿÿÿÿÿ2`
^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dimº
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims
ExpandDimsWRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/BroadcastTo:output:0gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims/dim:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2\
ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDimsÚ
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/CastCastcRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/ExpandDims:output:0*

DstT0*

SrcT0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast©
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/LessLess^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Range:output:0XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Cast:y:0*
T0*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Lessè
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
value	B :2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dim
MRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims
ExpandDimsJRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/range:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims/dim:output:0*
T0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2O
MRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDimsì
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0Const*
_output_shapes
: *
dtype0*
value	B :2U
SRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiplesPack\RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples/0:output:0NRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Maximum:z:0*
N*
T0*
_output_shapes
:2S
QRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/TileTileVRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/ExpandDims:output:0ZRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile/multiples:output:0*
T0	*0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ2I
GRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile®
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ShapeShapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape
cRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2e
cRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2®
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_sliceStridedSlice^RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape:output:0lRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_1:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:2_
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice
fRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 2h
fRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices®
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ProdProdfRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice:output:0oRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod/reduction_indices:output:0*
T0*
_output_shapes
: 2V
TRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod²
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1ShapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: 2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2Ê
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1StridedSlice`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_1:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_1:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *

begin_mask2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1²
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2ShapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0*
T0	*
_output_shapes
:2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB:2g
eRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB: 2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2i
gRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2È
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2StridedSlice`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Shape_2:output:0nRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_1:output:0pRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
end_mask2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2×
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1Pack]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Prod:output:0*
N*
T0*
_output_shapes
:2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1ü
[RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 2]
[RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concatConcatV2hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_1:output:0hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/values_1:output:0hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/strided_slice_2:output:0dRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat/axis:output:0*
N*
T0*
_output_shapes
:2X
VRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/ReshapeReshapePRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/Tile:output:0_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/concat:output:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*
valueB:
ÿÿÿÿÿÿÿÿÿ2a
_RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape³
YRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1ReshapeXRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/SequenceMask/Less:z:0hRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1/shape:output:0*
T0
*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2[
YRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1Ä
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/WhereWherebRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape_1:output:0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2W
URaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Whereá
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/SqueezeSqueeze]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Where:index:0*
T0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
squeeze_dims
2Y
WRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeeze
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 2_
]RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis½
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2GatherV2`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Reshape:output:0`RaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/Squeeze:output:0fRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0	*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2Z
XRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2ú
5RaggedReduceMean/RaggedReduceSum_1/UnsortedSegmentSumUnsortedSegmentSum#RaggedReduceMean/ones_like:output:0aRaggedReduceMean/RaggedReduceSum_1/RaggedSplitsToSegmentIds/Repeat/boolean_mask/GatherV2:output:0*RaggedReduceMean/RaggedReduceSum_1/sub:z:0*
T0*
Tindices0	*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ27
5RaggedReduceMean/RaggedReduceSum_1/UnsortedSegmentSumï
RaggedReduceMean/truedivRealDiv<RaggedReduceMean/RaggedReduceSum/UnsortedSegmentSum:output:0>RaggedReduceMean/RaggedReduceSum_1/UnsortedSegmentSum:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
RaggedReduceMean/truedivp
IdentityIdentityRaggedReduceMean/truediv:z:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2

Identity"
identityIdentity:output:0*O
_input_shapes>
<:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ:\ X
4
_output_shapes"
 :ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs:VR
0
_output_shapes
:ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

_user_specified_namemask"±L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*
serving_default
N
search_query>
serving_default_search_query:0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
P
watch_history?
serving_default_watch_history:0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿA
dense_output1
StatefulPartitionedCall:0ÿÿÿÿÿÿÿÿÿ¬tensorflow/serving/predict:Æ
¾f
layer-0
layer-1
layer_with_weights-0
layer-2
layer_with_weights-1
layer-3
layer-4
layer-5
layer-6
layer_with_weights-2
layer-7
	layer-8

layer_with_weights-3

layer-9
layer-10
layer_with_weights-4
layer-11
layer-12
layer_with_weights-5
layer-13
layer_with_weights-6
layer-14
	optimizer
trainable_variables
regularization_losses
	variables
	keras_api

signatures
Á_default_save_signature
+Â&call_and_return_all_conditional_losses
Ã__call__"òa
_tf_keras_networkÖa{"class_name": "Functional", "name": "model", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "must_restore_from_config": false, "config": {"name": "model", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "search_query"}, "name": "search_query", "inbound_nodes": []}, {"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "watch_history"}, "name": "watch_history", "inbound_nodes": []}, {"class_name": "Embedding", "config": {"name": "searched_embeddings", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 556, "output_dim": 16, "embeddings_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.05, "maxval": 0.05, "seed": null}}, "embeddings_regularizer": null, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": true, "input_length": null}, "name": "searched_embeddings", "inbound_nodes": [[["search_query", 0, 0, {}]]]}, {"class_name": "Embedding", "config": {"name": "watched_embeddings", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 556, "output_dim": 16, "embeddings_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.05, "maxval": 0.05, "seed": null}}, "embeddings_regularizer": null, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": true, "input_length": null}, "name": "watched_embeddings", "inbound_nodes": [[["watch_history", 0, 0, {}]]]}, {"class_name": "L2NormLayer", "config": {"name": "l2_norm_1", "trainable": true, "dtype": "float32"}, "name": "l2_norm_1", "inbound_nodes": [[["searched_embeddings", 0, 0, {}]], [["watched_embeddings", 0, 0, {}]]]}, {"class_name": "MaskedEmbeddingsAggregatorLayer", "config": {"agg_mode": "mean"}, "name": "aggregate_embeddings", "inbound_nodes": [[["l2_norm_1", 0, 0, {}]], [["l2_norm_1", 1, 0, {}]]]}, {"class_name": "Concatenate", "config": {"name": "concatenate", "trainable": true, "dtype": "float32", "axis": 1}, "name": "concatenate", "inbound_nodes": [[["aggregate_embeddings", 0, 0, {}], ["aggregate_embeddings", 1, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "dense_1", "trainable": true, "dtype": "float32", "units": 64, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_1", "inbound_nodes": [[["concatenate", 0, 0, {}]]]}, {"class_name": "ReLU", "config": {"name": "dense_1_relu", "trainable": true, "dtype": "float32", "max_value": null, "negative_slope": 0.0, "threshold": 0.0}, "name": "dense_1_relu", "inbound_nodes": [[["dense_1", 0, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "dense_2", "trainable": true, "dtype": "float32", "units": 64, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_2", "inbound_nodes": [[["dense_1_relu", 0, 0, {}]]]}, {"class_name": "ReLU", "config": {"name": "dense_2_relu", "trainable": true, "dtype": "float32", "max_value": null, "negative_slope": 0.0, "threshold": 0.0}, "name": "dense_2_relu", "inbound_nodes": [[["dense_2", 0, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "dense_3", "trainable": true, "dtype": "float32", "units": 64, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_3", "inbound_nodes": [[["dense_2_relu", 0, 0, {}]]]}, {"class_name": "ReLU", "config": {"name": "dense_3_relu", "trainable": true, "dtype": "float32", "max_value": null, "negative_slope": 0.0, "threshold": 0.0}, "name": "dense_3_relu", "inbound_nodes": [[["dense_3", 0, 0, {}]]]}, {"class_name": "BatchNormalization", "config": {"name": "dense_3_batch_norm", "trainable": true, "dtype": "float32", "axis": [1], "momentum": 0.99, "epsilon": 0.001, "center": true, "scale": true, "beta_initializer": {"class_name": "Zeros", "config": {}}, "gamma_initializer": {"class_name": "Ones", "config": {}}, "moving_mean_initializer": {"class_name": "Zeros", "config": {}}, "moving_variance_initializer": {"class_name": "Ones", "config": {}}, "beta_regularizer": null, "gamma_regularizer": null, "beta_constraint": null, "gamma_constraint": null}, "name": "dense_3_batch_norm", "inbound_nodes": [[["dense_3_relu", 0, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "dense_output", "trainable": true, "dtype": "float32", "units": 556, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_output", "inbound_nodes": [[["dense_3_batch_norm", 0, 0, {}]]]}], "input_layers": [["search_query", 0, 0], ["watch_history", 0, 0]], "output_layers": [["dense_output", 0, 0]]}, "input_spec": [{"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, null]}, "ndim": 2, "max_ndim": null, "min_ndim": null, "axes": {}}}, {"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, null]}, "ndim": 2, "max_ndim": null, "min_ndim": null, "axes": {}}}], "build_input_shape": [{"class_name": "TensorShape", "items": [null, null]}, {"class_name": "TensorShape", "items": [null, null]}], "is_graph_network": true, "keras_version": "2.4.0", "backend": "tensorflow", "model_config": {"class_name": "Functional", "config": {"name": "model", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "search_query"}, "name": "search_query", "inbound_nodes": []}, {"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "watch_history"}, "name": "watch_history", "inbound_nodes": []}, {"class_name": "Embedding", "config": {"name": "searched_embeddings", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 556, "output_dim": 16, "embeddings_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.05, "maxval": 0.05, "seed": null}}, "embeddings_regularizer": null, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": true, "input_length": null}, "name": "searched_embeddings", "inbound_nodes": [[["search_query", 0, 0, {}]]]}, {"class_name": "Embedding", "config": {"name": "watched_embeddings", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 556, "output_dim": 16, "embeddings_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.05, "maxval": 0.05, "seed": null}}, "embeddings_regularizer": null, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": true, "input_length": null}, "name": "watched_embeddings", "inbound_nodes": [[["watch_history", 0, 0, {}]]]}, {"class_name": "L2NormLayer", "config": {"name": "l2_norm_1", "trainable": true, "dtype": "float32"}, "name": "l2_norm_1", "inbound_nodes": [[["searched_embeddings", 0, 0, {}]], [["watched_embeddings", 0, 0, {}]]]}, {"class_name": "MaskedEmbeddingsAggregatorLayer", "config": {"agg_mode": "mean"}, "name": "aggregate_embeddings", "inbound_nodes": [[["l2_norm_1", 0, 0, {}]], [["l2_norm_1", 1, 0, {}]]]}, {"class_name": "Concatenate", "config": {"name": "concatenate", "trainable": true, "dtype": "float32", "axis": 1}, "name": "concatenate", "inbound_nodes": [[["aggregate_embeddings", 0, 0, {}], ["aggregate_embeddings", 1, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "dense_1", "trainable": true, "dtype": "float32", "units": 64, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_1", "inbound_nodes": [[["concatenate", 0, 0, {}]]]}, {"class_name": "ReLU", "config": {"name": "dense_1_relu", "trainable": true, "dtype": "float32", "max_value": null, "negative_slope": 0.0, "threshold": 0.0}, "name": "dense_1_relu", "inbound_nodes": [[["dense_1", 0, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "dense_2", "trainable": true, "dtype": "float32", "units": 64, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_2", "inbound_nodes": [[["dense_1_relu", 0, 0, {}]]]}, {"class_name": "ReLU", "config": {"name": "dense_2_relu", "trainable": true, "dtype": "float32", "max_value": null, "negative_slope": 0.0, "threshold": 0.0}, "name": "dense_2_relu", "inbound_nodes": [[["dense_2", 0, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "dense_3", "trainable": true, "dtype": "float32", "units": 64, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_3", "inbound_nodes": [[["dense_2_relu", 0, 0, {}]]]}, {"class_name": "ReLU", "config": {"name": "dense_3_relu", "trainable": true, "dtype": "float32", "max_value": null, "negative_slope": 0.0, "threshold": 0.0}, "name": "dense_3_relu", "inbound_nodes": [[["dense_3", 0, 0, {}]]]}, {"class_name": "BatchNormalization", "config": {"name": "dense_3_batch_norm", "trainable": true, "dtype": "float32", "axis": [1], "momentum": 0.99, "epsilon": 0.001, "center": true, "scale": true, "beta_initializer": {"class_name": "Zeros", "config": {}}, "gamma_initializer": {"class_name": "Ones", "config": {}}, "moving_mean_initializer": {"class_name": "Zeros", "config": {}}, "moving_variance_initializer": {"class_name": "Ones", "config": {}}, "beta_regularizer": null, "gamma_regularizer": null, "beta_constraint": null, "gamma_constraint": null}, "name": "dense_3_batch_norm", "inbound_nodes": [[["dense_3_relu", 0, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "dense_output", "trainable": true, "dtype": "float32", "units": 556, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_output", "inbound_nodes": [[["dense_3_batch_norm", 0, 0, {}]]]}], "input_layers": [["search_query", 0, 0], ["watch_history", 0, 0]], "output_layers": [["dense_output", 0, 0]]}}, "training_config": {"loss": "sparse_categorical_crossentropy", "metrics": null, "weighted_metrics": null, "loss_weights": null, "optimizer_config": {"class_name": "Adam", "config": {"name": "Adam", "learning_rate": 0.003000000026077032, "decay": 0.0, "beta_1": 0.8999999761581421, "beta_2": 0.9990000128746033, "epsilon": 1e-07, "amsgrad": false}}}}
ù"ö
_tf_keras_input_layerÖ{"class_name": "InputLayer", "name": "search_query", "dtype": "float32", "sparse": false, "ragged": false, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "search_query"}}
û"ø
_tf_keras_input_layerØ{"class_name": "InputLayer", "name": "watch_history", "dtype": "float32", "sparse": false, "ragged": false, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "watch_history"}}
À

embeddings
trainable_variables
regularization_losses
	variables
	keras_api
+Ä&call_and_return_all_conditional_losses
Å__call__"
_tf_keras_layer{"class_name": "Embedding", "name": "searched_embeddings", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "stateful": false, "must_restore_from_config": false, "config": {"name": "searched_embeddings", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 556, "output_dim": 16, "embeddings_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.05, "maxval": 0.05, "seed": null}}, "embeddings_regularizer": null, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": true, "input_length": null}, "build_input_shape": {"class_name": "TensorShape", "items": [null, null]}}
¾

embeddings
trainable_variables
regularization_losses
	variables
	keras_api
+Æ&call_and_return_all_conditional_losses
Ç__call__"
_tf_keras_layer{"class_name": "Embedding", "name": "watched_embeddings", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "stateful": false, "must_restore_from_config": false, "config": {"name": "watched_embeddings", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 556, "output_dim": 16, "embeddings_initializer": {"class_name": "RandomUniform", "config": {"minval": -0.05, "maxval": 0.05, "seed": null}}, "embeddings_regularizer": null, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": true, "input_length": null}, "build_input_shape": {"class_name": "TensorShape", "items": [null, null]}}
Ç
 trainable_variables
!regularization_losses
"	variables
#	keras_api
+È&call_and_return_all_conditional_losses
É__call__
	Êcall"«
_tf_keras_layer{"class_name": "L2NormLayer", "name": "l2_norm_1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "l2_norm_1", "trainable": true, "dtype": "float32"}}
¾
$trainable_variables
%regularization_losses
&	variables
'	keras_api
+Ë&call_and_return_all_conditional_losses
Ì__call__
	Ícall"¢
_tf_keras_layer{"class_name": "MaskedEmbeddingsAggregatorLayer", "name": "aggregate_embeddings", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"agg_mode": "mean"}}
Ê
(trainable_variables
)regularization_losses
*	variables
+	keras_api
+Î&call_and_return_all_conditional_losses
Ï__call__"¹
_tf_keras_layer{"class_name": "Concatenate", "name": "concatenate", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "concatenate", "trainable": true, "dtype": "float32", "axis": 1}, "build_input_shape": [{"class_name": "TensorShape", "items": [null, 16]}, {"class_name": "TensorShape", "items": [null, 16]}]}
ô

,kernel
-bias
.trainable_variables
/regularization_losses
0	variables
1	keras_api
+Ð&call_and_return_all_conditional_losses
Ñ__call__"Í
_tf_keras_layer³{"class_name": "Dense", "name": "dense_1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dense_1", "trainable": true, "dtype": "float32", "units": 64, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 32}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 32]}}
÷
2trainable_variables
3regularization_losses
4	variables
5	keras_api
+Ò&call_and_return_all_conditional_losses
Ó__call__"æ
_tf_keras_layerÌ{"class_name": "ReLU", "name": "dense_1_relu", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dense_1_relu", "trainable": true, "dtype": "float32", "max_value": null, "negative_slope": 0.0, "threshold": 0.0}}
ô

6kernel
7bias
8trainable_variables
9regularization_losses
:	variables
;	keras_api
+Ô&call_and_return_all_conditional_losses
Õ__call__"Í
_tf_keras_layer³{"class_name": "Dense", "name": "dense_2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dense_2", "trainable": true, "dtype": "float32", "units": 64, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 64}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 64]}}
÷
<trainable_variables
=regularization_losses
>	variables
?	keras_api
+Ö&call_and_return_all_conditional_losses
×__call__"æ
_tf_keras_layerÌ{"class_name": "ReLU", "name": "dense_2_relu", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dense_2_relu", "trainable": true, "dtype": "float32", "max_value": null, "negative_slope": 0.0, "threshold": 0.0}}
ô

@kernel
Abias
Btrainable_variables
Cregularization_losses
D	variables
E	keras_api
+Ø&call_and_return_all_conditional_losses
Ù__call__"Í
_tf_keras_layer³{"class_name": "Dense", "name": "dense_3", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dense_3", "trainable": true, "dtype": "float32", "units": 64, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 64}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 64]}}
÷
Ftrainable_variables
Gregularization_losses
H	variables
I	keras_api
+Ú&call_and_return_all_conditional_losses
Û__call__"æ
_tf_keras_layerÌ{"class_name": "ReLU", "name": "dense_3_relu", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dense_3_relu", "trainable": true, "dtype": "float32", "max_value": null, "negative_slope": 0.0, "threshold": 0.0}}
®	
Jaxis
	Kgamma
Lbeta
Mmoving_mean
Nmoving_variance
Otrainable_variables
Pregularization_losses
Q	variables
R	keras_api
+Ü&call_and_return_all_conditional_losses
Ý__call__"Ø
_tf_keras_layer¾{"class_name": "BatchNormalization", "name": "dense_3_batch_norm", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dense_3_batch_norm", "trainable": true, "dtype": "float32", "axis": [1], "momentum": 0.99, "epsilon": 0.001, "center": true, "scale": true, "beta_initializer": {"class_name": "Zeros", "config": {}}, "gamma_initializer": {"class_name": "Ones", "config": {}}, "moving_mean_initializer": {"class_name": "Zeros", "config": {}}, "moving_variance_initializer": {"class_name": "Ones", "config": {}}, "beta_regularizer": null, "gamma_regularizer": null, "beta_constraint": null, "gamma_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 2, "max_ndim": null, "min_ndim": null, "axes": {"1": 64}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 64]}}


Skernel
Tbias
Utrainable_variables
Vregularization_losses
W	variables
X	keras_api
+Þ&call_and_return_all_conditional_losses
ß__call__"Ù
_tf_keras_layer¿{"class_name": "Dense", "name": "dense_output", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dense_output", "trainable": true, "dtype": "float32", "units": 556, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 64}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 64]}}
Ã
Yiter

Zbeta_1

[beta_2
	\decay
]learning_ratem©mª,m«-m¬6m­7m®@m¯Am°Km±Lm²Sm³Tm´vµv¶,v·-v¸6v¹7vº@v»Av¼Kv½Lv¾Sv¿TvÀ"
	optimizer
v
0
1
,2
-3
64
75
@6
A7
K8
L9
S10
T11"
trackable_list_wrapper
 "
trackable_list_wrapper

0
1
,2
-3
64
75
@6
A7
K8
L9
M10
N11
S12
T13"
trackable_list_wrapper
Î
^metrics
_layer_metrics
`layer_regularization_losses
anon_trainable_variables

blayers
trainable_variables
regularization_losses
	variables
Ã__call__
Á_default_save_signature
+Â&call_and_return_all_conditional_losses
'Â"call_and_return_conditional_losses"
_generic_user_object
-
àserving_default"
signature_map
1:/	¬2searched_embeddings/embeddings
'
0"
trackable_list_wrapper
 "
trackable_list_wrapper
'
0"
trackable_list_wrapper
°
cmetrics
dlayer_metrics
elayer_regularization_losses
fnon_trainable_variables

glayers
trainable_variables
regularization_losses
	variables
Å__call__
+Ä&call_and_return_all_conditional_losses
'Ä"call_and_return_conditional_losses"
_generic_user_object
0:.	¬2watched_embeddings/embeddings
'
0"
trackable_list_wrapper
 "
trackable_list_wrapper
'
0"
trackable_list_wrapper
°
hmetrics
ilayer_metrics
jlayer_regularization_losses
knon_trainable_variables

llayers
trainable_variables
regularization_losses
	variables
Ç__call__
+Æ&call_and_return_all_conditional_losses
'Æ"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
°
mmetrics
nlayer_metrics
olayer_regularization_losses
pnon_trainable_variables

qlayers
 trainable_variables
!regularization_losses
"	variables
É__call__
+È&call_and_return_all_conditional_losses
'È"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
°
rmetrics
slayer_metrics
tlayer_regularization_losses
unon_trainable_variables

vlayers
$trainable_variables
%regularization_losses
&	variables
Ì__call__
+Ë&call_and_return_all_conditional_losses
'Ë"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
°
wmetrics
xlayer_metrics
ylayer_regularization_losses
znon_trainable_variables

{layers
(trainable_variables
)regularization_losses
*	variables
Ï__call__
+Î&call_and_return_all_conditional_losses
'Î"call_and_return_conditional_losses"
_generic_user_object
 : @2dense_1/kernel
:@2dense_1/bias
.
,0
-1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
,0
-1"
trackable_list_wrapper
±
|metrics
}layer_metrics
~layer_regularization_losses
non_trainable_variables
layers
.trainable_variables
/regularization_losses
0	variables
Ñ__call__
+Ð&call_and_return_all_conditional_losses
'Ð"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
µ
metrics
layer_metrics
 layer_regularization_losses
non_trainable_variables
layers
2trainable_variables
3regularization_losses
4	variables
Ó__call__
+Ò&call_and_return_all_conditional_losses
'Ò"call_and_return_conditional_losses"
_generic_user_object
 :@@2dense_2/kernel
:@2dense_2/bias
.
60
71"
trackable_list_wrapper
 "
trackable_list_wrapper
.
60
71"
trackable_list_wrapper
µ
metrics
layer_metrics
 layer_regularization_losses
non_trainable_variables
layers
8trainable_variables
9regularization_losses
:	variables
Õ__call__
+Ô&call_and_return_all_conditional_losses
'Ô"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
µ
metrics
layer_metrics
 layer_regularization_losses
non_trainable_variables
layers
<trainable_variables
=regularization_losses
>	variables
×__call__
+Ö&call_and_return_all_conditional_losses
'Ö"call_and_return_conditional_losses"
_generic_user_object
 :@@2dense_3/kernel
:@2dense_3/bias
.
@0
A1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
@0
A1"
trackable_list_wrapper
µ
metrics
layer_metrics
 layer_regularization_losses
non_trainable_variables
layers
Btrainable_variables
Cregularization_losses
D	variables
Ù__call__
+Ø&call_and_return_all_conditional_losses
'Ø"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
µ
metrics
layer_metrics
 layer_regularization_losses
non_trainable_variables
layers
Ftrainable_variables
Gregularization_losses
H	variables
Û__call__
+Ú&call_and_return_all_conditional_losses
'Ú"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
&:$@2dense_3_batch_norm/gamma
%:#@2dense_3_batch_norm/beta
.:,@ (2dense_3_batch_norm/moving_mean
2:0@ (2"dense_3_batch_norm/moving_variance
.
K0
L1"
trackable_list_wrapper
 "
trackable_list_wrapper
<
K0
L1
M2
N3"
trackable_list_wrapper
µ
metrics
layer_metrics
 layer_regularization_losses
non_trainable_variables
layers
Otrainable_variables
Pregularization_losses
Q	variables
Ý__call__
+Ü&call_and_return_all_conditional_losses
'Ü"call_and_return_conditional_losses"
_generic_user_object
&:$	@¬2dense_output/kernel
 :¬2dense_output/bias
.
S0
T1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
S0
T1"
trackable_list_wrapper
µ
metrics
 layer_metrics
 ¡layer_regularization_losses
¢non_trainable_variables
£layers
Utrainable_variables
Vregularization_losses
W	variables
ß__call__
+Þ&call_and_return_all_conditional_losses
'Þ"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
(
¤0"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
.
M0
N1"
trackable_list_wrapper

0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
.
M0
N1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
¿

¥total

¦count
§	variables
¨	keras_api"
_tf_keras_metricj{"class_name": "Mean", "name": "loss", "dtype": "float32", "config": {"name": "loss", "dtype": "float32"}}
:  (2total
:  (2count
0
¥0
¦1"
trackable_list_wrapper
.
§	variables"
_generic_user_object
6:4	¬2%Adam/searched_embeddings/embeddings/m
5:3	¬2$Adam/watched_embeddings/embeddings/m
%:# @2Adam/dense_1/kernel/m
:@2Adam/dense_1/bias/m
%:#@@2Adam/dense_2/kernel/m
:@2Adam/dense_2/bias/m
%:#@@2Adam/dense_3/kernel/m
:@2Adam/dense_3/bias/m
+:)@2Adam/dense_3_batch_norm/gamma/m
*:(@2Adam/dense_3_batch_norm/beta/m
+:)	@¬2Adam/dense_output/kernel/m
%:#¬2Adam/dense_output/bias/m
6:4	¬2%Adam/searched_embeddings/embeddings/v
5:3	¬2$Adam/watched_embeddings/embeddings/v
%:# @2Adam/dense_1/kernel/v
:@2Adam/dense_1/bias/v
%:#@@2Adam/dense_2/kernel/v
:@2Adam/dense_2/bias/v
%:#@@2Adam/dense_3/kernel/v
:@2Adam/dense_3/bias/v
+:)@2Adam/dense_3_batch_norm/gamma/v
*:(@2Adam/dense_3_batch_norm/beta/v
+:)	@¬2Adam/dense_output/kernel/v
%:#¬2Adam/dense_output/bias/v
£2 
 __inference__wrapped_model_14564û
²
FullArgSpec
args 
varargsjargs
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *k¢h
fc
/,
search_queryÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
0-
watch_historyÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
Î2Ë
@__inference_model_layer_call_and_return_conditional_losses_15287
@__inference_model_layer_call_and_return_conditional_losses_15591
@__inference_model_layer_call_and_return_conditional_losses_15662
@__inference_model_layer_call_and_return_conditional_losses_15235À
·²³
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
â2ß
%__inference_model_layer_call_fn_15696
%__inference_model_layer_call_fn_15460
%__inference_model_layer_call_fn_15374
%__inference_model_layer_call_fn_15730À
·²³
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
ø2õ
N__inference_searched_embeddings_layer_call_and_return_conditional_losses_15740¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
Ý2Ú
3__inference_searched_embeddings_layer_call_fn_15747¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
÷2ô
M__inference_watched_embeddings_layer_call_and_return_conditional_losses_15757¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
Ü2Ù
2__inference_watched_embeddings_layer_call_fn_15764¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
û2ø
D__inference_l2_norm_1_layer_call_and_return_conditional_losses_15818¯
¦²¢
FullArgSpec%
args
jself
jinputs
jmask
varargs
 
varkw
 
defaults¢

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
à2Ý
)__inference_l2_norm_1_layer_call_fn_15824¯
¦²¢
FullArgSpec%
args
jself
jinputs
jmask
varargs
 
varkw
 
defaults¢

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
å2â
__inference_call_15878
__inference_call_15932¯
¦²¢
FullArgSpec%
args
jself
jinputs
jmask
varargs
 
varkw
 
defaults¢

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
2
O__inference_aggregate_embeddings_layer_call_and_return_conditional_losses_16140¯
¦²¢
FullArgSpec%
args
jself
jinputs
jmask
varargs
 
varkw
 
defaults¢

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ë2è
4__inference_aggregate_embeddings_layer_call_fn_16146¯
¦²¢
FullArgSpec%
args
jself
jinputs
jmask
varargs
 
varkw
 
defaults¢

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
å2â
__inference_call_16354
__inference_call_16514¯
¦²¢
FullArgSpec%
args
jself
jinputs
jmask
varargs
 
varkw
 
defaults¢

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ð2í
F__inference_concatenate_layer_call_and_return_conditional_losses_16521¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
Õ2Ò
+__inference_concatenate_layer_call_fn_16527¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ì2é
B__inference_dense_1_layer_call_and_return_conditional_losses_16537¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
Ñ2Î
'__inference_dense_1_layer_call_fn_16546¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ñ2î
G__inference_dense_1_relu_layer_call_and_return_conditional_losses_16551¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
Ö2Ó
,__inference_dense_1_relu_layer_call_fn_16556¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ì2é
B__inference_dense_2_layer_call_and_return_conditional_losses_16566¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
Ñ2Î
'__inference_dense_2_layer_call_fn_16575¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ñ2î
G__inference_dense_2_relu_layer_call_and_return_conditional_losses_16580¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
Ö2Ó
,__inference_dense_2_relu_layer_call_fn_16585¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ì2é
B__inference_dense_3_layer_call_and_return_conditional_losses_16595¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
Ñ2Î
'__inference_dense_3_layer_call_fn_16604¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ñ2î
G__inference_dense_3_relu_layer_call_and_return_conditional_losses_16609¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
Ö2Ó
,__inference_dense_3_relu_layer_call_fn_16614¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
Ø2Õ
M__inference_dense_3_batch_norm_layer_call_and_return_conditional_losses_16650
M__inference_dense_3_batch_norm_layer_call_and_return_conditional_losses_16670´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
¢2
2__inference_dense_3_batch_norm_layer_call_fn_16696
2__inference_dense_3_batch_norm_layer_call_fn_16683´
«²§
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaultsª 
annotationsª *
 
ñ2î
G__inference_dense_output_layer_call_and_return_conditional_losses_16707¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
Ö2Ó
,__inference_dense_output_layer_call_fn_16716¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ÜBÙ
#__inference_signature_wrapper_15504search_querywatch_history"
²
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 ê
 __inference__wrapped_model_14564Å,-67@ANKMLSTu¢r
k¢h
fc
/,
search_queryÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
0-
watch_historyÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
ª "<ª9
7
dense_output'$
dense_outputÿÿÿÿÿÿÿÿÿ¬â
O__inference_aggregate_embeddings_layer_call_and_return_conditional_losses_16140e¢b
[¢X
-*
inputsÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
'$
maskÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 º
4__inference_aggregate_embeddings_layer_call_fn_16146e¢b
[¢X
-*
inputsÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
'$
maskÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

ª "ÿÿÿÿÿÿÿÿÿ{
__inference_call_15878aA¢>
7¢4

inputs

mask

ª "ÿÿÿÿÿÿÿÿÿ©
__inference_call_15932e¢b
[¢X
-*
inputsÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
'$
maskÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

ª "%"ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
__inference_call_16354e¢b
[¢X
-*
inputsÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
'$
maskÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

ª "ÿÿÿÿÿÿÿÿÿw
__inference_call_16514]J¢G
@¢=
$!
inputsÿÿÿÿÿÿÿÿÿ

mask

ª "Î
F__inference_concatenate_layer_call_and_return_conditional_losses_16521Z¢W
P¢M
KH
"
inputs/0ÿÿÿÿÿÿÿÿÿ
"
inputs/1ÿÿÿÿÿÿÿÿÿ
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ 
 ¥
+__inference_concatenate_layer_call_fn_16527vZ¢W
P¢M
KH
"
inputs/0ÿÿÿÿÿÿÿÿÿ
"
inputs/1ÿÿÿÿÿÿÿÿÿ
ª "ÿÿÿÿÿÿÿÿÿ ¢
B__inference_dense_1_layer_call_and_return_conditional_losses_16537\,-/¢,
%¢"
 
inputsÿÿÿÿÿÿÿÿÿ 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ@
 z
'__inference_dense_1_layer_call_fn_16546O,-/¢,
%¢"
 
inputsÿÿÿÿÿÿÿÿÿ 
ª "ÿÿÿÿÿÿÿÿÿ@£
G__inference_dense_1_relu_layer_call_and_return_conditional_losses_16551X/¢,
%¢"
 
inputsÿÿÿÿÿÿÿÿÿ@
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ@
 {
,__inference_dense_1_relu_layer_call_fn_16556K/¢,
%¢"
 
inputsÿÿÿÿÿÿÿÿÿ@
ª "ÿÿÿÿÿÿÿÿÿ@¢
B__inference_dense_2_layer_call_and_return_conditional_losses_16566\67/¢,
%¢"
 
inputsÿÿÿÿÿÿÿÿÿ@
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ@
 z
'__inference_dense_2_layer_call_fn_16575O67/¢,
%¢"
 
inputsÿÿÿÿÿÿÿÿÿ@
ª "ÿÿÿÿÿÿÿÿÿ@£
G__inference_dense_2_relu_layer_call_and_return_conditional_losses_16580X/¢,
%¢"
 
inputsÿÿÿÿÿÿÿÿÿ@
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ@
 {
,__inference_dense_2_relu_layer_call_fn_16585K/¢,
%¢"
 
inputsÿÿÿÿÿÿÿÿÿ@
ª "ÿÿÿÿÿÿÿÿÿ@³
M__inference_dense_3_batch_norm_layer_call_and_return_conditional_losses_16650bMNKL3¢0
)¢&
 
inputsÿÿÿÿÿÿÿÿÿ@
p
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ@
 ³
M__inference_dense_3_batch_norm_layer_call_and_return_conditional_losses_16670bNKML3¢0
)¢&
 
inputsÿÿÿÿÿÿÿÿÿ@
p 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ@
 
2__inference_dense_3_batch_norm_layer_call_fn_16683UMNKL3¢0
)¢&
 
inputsÿÿÿÿÿÿÿÿÿ@
p
ª "ÿÿÿÿÿÿÿÿÿ@
2__inference_dense_3_batch_norm_layer_call_fn_16696UNKML3¢0
)¢&
 
inputsÿÿÿÿÿÿÿÿÿ@
p 
ª "ÿÿÿÿÿÿÿÿÿ@¢
B__inference_dense_3_layer_call_and_return_conditional_losses_16595\@A/¢,
%¢"
 
inputsÿÿÿÿÿÿÿÿÿ@
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ@
 z
'__inference_dense_3_layer_call_fn_16604O@A/¢,
%¢"
 
inputsÿÿÿÿÿÿÿÿÿ@
ª "ÿÿÿÿÿÿÿÿÿ@£
G__inference_dense_3_relu_layer_call_and_return_conditional_losses_16609X/¢,
%¢"
 
inputsÿÿÿÿÿÿÿÿÿ@
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ@
 {
,__inference_dense_3_relu_layer_call_fn_16614K/¢,
%¢"
 
inputsÿÿÿÿÿÿÿÿÿ@
ª "ÿÿÿÿÿÿÿÿÿ@¨
G__inference_dense_output_layer_call_and_return_conditional_losses_16707]ST/¢,
%¢"
 
inputsÿÿÿÿÿÿÿÿÿ@
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ¬
 
,__inference_dense_output_layer_call_fn_16716PST/¢,
%¢"
 
inputsÿÿÿÿÿÿÿÿÿ@
ª "ÿÿÿÿÿÿÿÿÿ¬ä
D__inference_l2_norm_1_layer_call_and_return_conditional_losses_15818e¢b
[¢X
-*
inputsÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
'$
maskÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

ª "2¢/
(%
0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 ¼
)__inference_l2_norm_1_layer_call_fn_15824e¢b
[¢X
-*
inputsÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
'$
maskÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ

ª "%"ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿü
@__inference_model_layer_call_and_return_conditional_losses_15235·,-67@AMNKLST}¢z
s¢p
fc
/,
search_queryÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
0-
watch_historyÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p

 
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ¬
 ü
@__inference_model_layer_call_and_return_conditional_losses_15287·,-67@ANKMLST}¢z
s¢p
fc
/,
search_queryÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
0-
watch_historyÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p 

 
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ¬
 ó
@__inference_model_layer_call_and_return_conditional_losses_15591®,-67@AMNKLSTt¢q
j¢g
]Z
+(
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
+(
inputs/1ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p

 
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ¬
 ó
@__inference_model_layer_call_and_return_conditional_losses_15662®,-67@ANKMLSTt¢q
j¢g
]Z
+(
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
+(
inputs/1ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p 

 
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ¬
 Ô
%__inference_model_layer_call_fn_15374ª,-67@AMNKLST}¢z
s¢p
fc
/,
search_queryÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
0-
watch_historyÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p

 
ª "ÿÿÿÿÿÿÿÿÿ¬Ô
%__inference_model_layer_call_fn_15460ª,-67@ANKMLST}¢z
s¢p
fc
/,
search_queryÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
0-
watch_historyÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p 

 
ª "ÿÿÿÿÿÿÿÿÿ¬Ë
%__inference_model_layer_call_fn_15696¡,-67@AMNKLSTt¢q
j¢g
]Z
+(
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
+(
inputs/1ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p

 
ª "ÿÿÿÿÿÿÿÿÿ¬Ë
%__inference_model_layer_call_fn_15730¡,-67@ANKMLSTt¢q
j¢g
]Z
+(
inputs/0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
+(
inputs/1ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
p 

 
ª "ÿÿÿÿÿÿÿÿÿ¬Ã
N__inference_searched_embeddings_layer_call_and_return_conditional_losses_15740q8¢5
.¢+
)&
inputsÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
ª "2¢/
(%
0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
3__inference_searched_embeddings_layer_call_fn_15747d8¢5
.¢+
)&
inputsÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
ª "%"ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
#__inference_signature_wrapper_15504å,-67@ANKMLST¢
¢ 
ª
?
search_query/,
search_queryÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
A
watch_history0-
watch_historyÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"<ª9
7
dense_output'$
dense_outputÿÿÿÿÿÿÿÿÿ¬Â
M__inference_watched_embeddings_layer_call_and_return_conditional_losses_15757q8¢5
.¢+
)&
inputsÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
ª "2¢/
(%
0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
 
2__inference_watched_embeddings_layer_call_fn_15764d8¢5
.¢+
)&
inputsÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ
ª "%"ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ