.class public Lcom/beyond/sui/AutomataX;
.super Ljava/lang/Object;
.source "AutomataX.java"


# static fields
.field public static final ENG_BIG:I = 0x10

.field public static final ENG_SMALL:I = 0x20

.field public static final HANGUL_JAUM:I = 0x1

.field public static final HANGUL_MOUM:I = 0x2

.field public static final NUMBER:I = 0x40

.field public static final SPECIAL:I = 0x80

.field private static instance:Lcom/beyond/sui/AutomataX;


# instance fields
.field final HANGUL_MODE:I

.field private final UNDEFINED:I

.field private composedBuffer:Ljava/lang/StringBuffer;

.field private hanChosung:I

.field private final hanChosungTable:[[I

.field private hanJongsung:I

.field private final hanJongsungTable:[[I

.field private hanJungsung:I

.field private final hanJungsungTable:[[I

.field inputMode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 125
    const/4 v0, 0x0

    sput-object v0, Lcom/beyond/sui/AutomataX;->instance:Lcom/beyond/sui/AutomataX;

    .line 4
    return-void
.end method

.method public constructor <init>()V
    .locals 8

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, -0x1

    const/4 v3, 0x3

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput v4, p0, Lcom/beyond/sui/AutomataX;->UNDEFINED:I

    .line 23
    const/16 v0, 0x13

    new-array v0, v0, [[I

    .line 24
    new-array v1, v3, [I

    fill-array-data v1, :array_0

    aput-object v1, v0, v5

    .line 25
    new-array v1, v3, [I

    fill-array-data v1, :array_1

    aput-object v1, v0, v6

    .line 26
    new-array v1, v3, [I

    fill-array-data v1, :array_2

    aput-object v1, v0, v7

    .line 27
    new-array v1, v3, [I

    fill-array-data v1, :array_3

    aput-object v1, v0, v3

    const/4 v1, 0x4

    .line 28
    new-array v2, v3, [I

    fill-array-data v2, :array_4

    aput-object v2, v0, v1

    const/4 v1, 0x5

    .line 29
    new-array v2, v3, [I

    fill-array-data v2, :array_5

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 30
    new-array v2, v3, [I

    fill-array-data v2, :array_6

    aput-object v2, v0, v1

    const/4 v1, 0x7

    .line 31
    new-array v2, v3, [I

    fill-array-data v2, :array_7

    aput-object v2, v0, v1

    const/16 v1, 0x8

    .line 32
    new-array v2, v3, [I

    fill-array-data v2, :array_8

    aput-object v2, v0, v1

    const/16 v1, 0x9

    .line 33
    new-array v2, v3, [I

    fill-array-data v2, :array_9

    aput-object v2, v0, v1

    const/16 v1, 0xa

    .line 34
    new-array v2, v3, [I

    fill-array-data v2, :array_a

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 35
    new-array v2, v3, [I

    fill-array-data v2, :array_b

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 36
    new-array v2, v3, [I

    fill-array-data v2, :array_c

    aput-object v2, v0, v1

    const/16 v1, 0xd

    .line 37
    new-array v2, v3, [I

    fill-array-data v2, :array_d

    aput-object v2, v0, v1

    const/16 v1, 0xe

    .line 38
    new-array v2, v3, [I

    fill-array-data v2, :array_e

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 39
    new-array v2, v3, [I

    fill-array-data v2, :array_f

    aput-object v2, v0, v1

    const/16 v1, 0x10

    .line 40
    new-array v2, v3, [I

    fill-array-data v2, :array_10

    aput-object v2, v0, v1

    const/16 v1, 0x11

    .line 41
    new-array v2, v3, [I

    fill-array-data v2, :array_11

    aput-object v2, v0, v1

    const/16 v1, 0x12

    .line 42
    new-array v2, v3, [I

    fill-array-data v2, :array_12

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/beyond/sui/AutomataX;->hanChosungTable:[[I

    .line 48
    const/16 v0, 0x15

    new-array v0, v0, [[I

    .line 49
    new-array v1, v3, [I

    fill-array-data v1, :array_13

    aput-object v1, v0, v5

    .line 50
    new-array v1, v3, [I

    fill-array-data v1, :array_14

    aput-object v1, v0, v6

    .line 51
    new-array v1, v3, [I

    fill-array-data v1, :array_15

    aput-object v1, v0, v7

    .line 52
    new-array v1, v3, [I

    fill-array-data v1, :array_16

    aput-object v1, v0, v3

    const/4 v1, 0x4

    .line 53
    new-array v2, v3, [I

    fill-array-data v2, :array_17

    aput-object v2, v0, v1

    const/4 v1, 0x5

    .line 54
    new-array v2, v3, [I

    fill-array-data v2, :array_18

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 55
    new-array v2, v3, [I

    fill-array-data v2, :array_19

    aput-object v2, v0, v1

    const/4 v1, 0x7

    .line 56
    new-array v2, v3, [I

    fill-array-data v2, :array_1a

    aput-object v2, v0, v1

    const/16 v1, 0x8

    .line 57
    new-array v2, v3, [I

    fill-array-data v2, :array_1b

    aput-object v2, v0, v1

    const/16 v1, 0x9

    .line 58
    new-array v2, v3, [I

    fill-array-data v2, :array_1c

    aput-object v2, v0, v1

    const/16 v1, 0xa

    .line 59
    new-array v2, v3, [I

    fill-array-data v2, :array_1d

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 60
    new-array v2, v3, [I

    fill-array-data v2, :array_1e

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 61
    new-array v2, v3, [I

    fill-array-data v2, :array_1f

    aput-object v2, v0, v1

    const/16 v1, 0xd

    .line 62
    new-array v2, v3, [I

    fill-array-data v2, :array_20

    aput-object v2, v0, v1

    const/16 v1, 0xe

    .line 63
    new-array v2, v3, [I

    fill-array-data v2, :array_21

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 64
    new-array v2, v3, [I

    fill-array-data v2, :array_22

    aput-object v2, v0, v1

    const/16 v1, 0x10

    .line 65
    new-array v2, v3, [I

    fill-array-data v2, :array_23

    aput-object v2, v0, v1

    const/16 v1, 0x11

    .line 66
    new-array v2, v3, [I

    fill-array-data v2, :array_24

    aput-object v2, v0, v1

    const/16 v1, 0x12

    .line 67
    new-array v2, v3, [I

    fill-array-data v2, :array_25

    aput-object v2, v0, v1

    const/16 v1, 0x13

    .line 68
    new-array v2, v3, [I

    fill-array-data v2, :array_26

    aput-object v2, v0, v1

    const/16 v1, 0x14

    .line 69
    new-array v2, v3, [I

    fill-array-data v2, :array_27

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/beyond/sui/AutomataX;->hanJungsungTable:[[I

    .line 75
    const/16 v0, 0x1b

    new-array v0, v0, [[I

    .line 76
    new-array v1, v3, [I

    fill-array-data v1, :array_28

    aput-object v1, v0, v5

    .line 77
    new-array v1, v3, [I

    fill-array-data v1, :array_29

    aput-object v1, v0, v6

    .line 78
    new-array v1, v3, [I

    fill-array-data v1, :array_2a

    aput-object v1, v0, v7

    .line 79
    new-array v1, v3, [I

    fill-array-data v1, :array_2b

    aput-object v1, v0, v3

    const/4 v1, 0x4

    .line 80
    new-array v2, v3, [I

    fill-array-data v2, :array_2c

    aput-object v2, v0, v1

    const/4 v1, 0x5

    .line 81
    new-array v2, v3, [I

    fill-array-data v2, :array_2d

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 82
    new-array v2, v3, [I

    fill-array-data v2, :array_2e

    aput-object v2, v0, v1

    const/4 v1, 0x7

    .line 83
    new-array v2, v3, [I

    fill-array-data v2, :array_2f

    aput-object v2, v0, v1

    const/16 v1, 0x8

    .line 84
    new-array v2, v3, [I

    fill-array-data v2, :array_30

    aput-object v2, v0, v1

    const/16 v1, 0x9

    .line 85
    new-array v2, v3, [I

    fill-array-data v2, :array_31

    aput-object v2, v0, v1

    const/16 v1, 0xa

    .line 86
    new-array v2, v3, [I

    fill-array-data v2, :array_32

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 87
    new-array v2, v3, [I

    fill-array-data v2, :array_33

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 88
    new-array v2, v3, [I

    fill-array-data v2, :array_34

    aput-object v2, v0, v1

    const/16 v1, 0xd

    .line 89
    new-array v2, v3, [I

    fill-array-data v2, :array_35

    aput-object v2, v0, v1

    const/16 v1, 0xe

    .line 90
    new-array v2, v3, [I

    fill-array-data v2, :array_36

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 91
    new-array v2, v3, [I

    fill-array-data v2, :array_37

    aput-object v2, v0, v1

    const/16 v1, 0x10

    .line 92
    new-array v2, v3, [I

    fill-array-data v2, :array_38

    aput-object v2, v0, v1

    const/16 v1, 0x11

    .line 93
    new-array v2, v3, [I

    fill-array-data v2, :array_39

    aput-object v2, v0, v1

    const/16 v1, 0x12

    .line 94
    new-array v2, v3, [I

    fill-array-data v2, :array_3a

    aput-object v2, v0, v1

    const/16 v1, 0x13

    .line 95
    new-array v2, v3, [I

    fill-array-data v2, :array_3b

    aput-object v2, v0, v1

    const/16 v1, 0x14

    .line 96
    new-array v2, v3, [I

    fill-array-data v2, :array_3c

    aput-object v2, v0, v1

    const/16 v1, 0x15

    .line 97
    new-array v2, v3, [I

    fill-array-data v2, :array_3d

    aput-object v2, v0, v1

    const/16 v1, 0x16

    .line 98
    new-array v2, v3, [I

    fill-array-data v2, :array_3e

    aput-object v2, v0, v1

    const/16 v1, 0x17

    .line 99
    new-array v2, v3, [I

    fill-array-data v2, :array_3f

    aput-object v2, v0, v1

    const/16 v1, 0x18

    .line 100
    new-array v2, v3, [I

    fill-array-data v2, :array_40

    aput-object v2, v0, v1

    const/16 v1, 0x19

    .line 101
    new-array v2, v3, [I

    fill-array-data v2, :array_41

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    .line 102
    new-array v2, v3, [I

    fill-array-data v2, :array_42

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    .line 112
    iput v3, p0, Lcom/beyond/sui/AutomataX;->HANGUL_MODE:I

    .line 114
    iput v3, p0, Lcom/beyond/sui/AutomataX;->inputMode:I

    .line 116
    iput v4, p0, Lcom/beyond/sui/AutomataX;->hanChosung:I

    .line 117
    iput v4, p0, Lcom/beyond/sui/AutomataX;->hanJungsung:I

    .line 118
    iput v4, p0, Lcom/beyond/sui/AutomataX;->hanJongsung:I

    .line 123
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lcom/beyond/sui/AutomataX;->composedBuffer:Ljava/lang/StringBuffer;

    .line 132
    invoke-direct {p0}, Lcom/beyond/sui/AutomataX;->reset()V

    .line 133
    return-void

    .line 24
    :array_0
    .array-data 4
        0x1100
        -0x1
        0x1100
    .end array-data

    .line 25
    :array_1
    .array-data 4
        0x1100
        0x1100
        0x1101
    .end array-data

    .line 26
    :array_2
    .array-data 4
        0x1102
        -0x1
        0x1102
    .end array-data

    .line 27
    :array_3
    .array-data 4
        0x1103
        -0x1
        0x1103
    .end array-data

    .line 28
    :array_4
    .array-data 4
        0x1103
        0x1103
        0x1104
    .end array-data

    .line 29
    :array_5
    .array-data 4
        0x1105
        -0x1
        0x1105
    .end array-data

    .line 30
    :array_6
    .array-data 4
        0x1106
        -0x1
        0x1106
    .end array-data

    .line 31
    :array_7
    .array-data 4
        0x1107
        -0x1
        0x1107
    .end array-data

    .line 32
    :array_8
    .array-data 4
        0x1107
        0x1107
        0x1108
    .end array-data

    .line 33
    :array_9
    .array-data 4
        0x1109
        -0x1
        0x1109
    .end array-data

    .line 34
    :array_a
    .array-data 4
        0x1109
        0x1109
        0x110a
    .end array-data

    .line 35
    :array_b
    .array-data 4
        0x110b
        -0x1
        0x110b
    .end array-data

    .line 36
    :array_c
    .array-data 4
        0x110c
        -0x1
        0x110c
    .end array-data

    .line 37
    :array_d
    .array-data 4
        0x110d
        -0x1
        0x110d
    .end array-data

    .line 38
    :array_e
    .array-data 4
        0x110e
        -0x1
        0x110e
    .end array-data

    .line 39
    :array_f
    .array-data 4
        0x110f
        -0x1
        0x110f
    .end array-data

    .line 40
    :array_10
    .array-data 4
        0x1110
        -0x1
        0x1110
    .end array-data

    .line 41
    :array_11
    .array-data 4
        0x1111
        -0x1
        0x1111
    .end array-data

    .line 42
    :array_12
    .array-data 4
        0x1112
        -0x1
        0x1112
    .end array-data

    .line 49
    :array_13
    .array-data 4
        0x1161
        -0x1
        0x1161
    .end array-data

    .line 50
    :array_14
    .array-data 4
        0x1162
        -0x1
        0x1162
    .end array-data

    .line 51
    :array_15
    .array-data 4
        0x1163
        -0x1
        0x1163
    .end array-data

    .line 52
    :array_16
    .array-data 4
        0x1163
        0x1175
        0x1164
    .end array-data

    .line 53
    :array_17
    .array-data 4
        0x1165
        -0x1
        0x1165
    .end array-data

    .line 54
    :array_18
    .array-data 4
        0x1166
        -0x1
        0x1166
    .end array-data

    .line 55
    :array_19
    .array-data 4
        0x1167
        -0x1
        0x1167
    .end array-data

    .line 56
    :array_1a
    .array-data 4
        0x1167
        0x1175
        0x1168
    .end array-data

    .line 57
    :array_1b
    .array-data 4
        0x1169
        -0x1
        0x1169
    .end array-data

    .line 58
    :array_1c
    .array-data 4
        0x1169
        0x1161
        0x116a
    .end array-data

    .line 59
    :array_1d
    .array-data 4
        0x1169
        -0x1
        0x116b
    .end array-data

    .line 60
    :array_1e
    .array-data 4
        0x1169
        0x1175
        0x116c
    .end array-data

    .line 61
    :array_1f
    .array-data 4
        0x116d
        -0x1
        0x116d
    .end array-data

    .line 62
    :array_20
    .array-data 4
        0x116e
        -0x1
        0x116e
    .end array-data

    .line 63
    :array_21
    .array-data 4
        0x116e
        0x1165
        0x116f
    .end array-data

    .line 64
    :array_22
    .array-data 4
        0x116e
        0x1166
        0x1170
    .end array-data

    .line 65
    :array_23
    .array-data 4
        0x116e
        0x1175
        0x1171
    .end array-data

    .line 66
    :array_24
    .array-data 4
        0x1172
        -0x1
        0x1172
    .end array-data

    .line 67
    :array_25
    .array-data 4
        0x1173
        -0x1
        0x1173
    .end array-data

    .line 68
    :array_26
    .array-data 4
        0x1173
        0x1175
        0x1174
    .end array-data

    .line 69
    :array_27
    .array-data 4
        0x1175
        -0x1
        0x1175
    .end array-data

    .line 76
    :array_28
    .array-data 4
        0x1100
        -0x1
        0x11a8
    .end array-data

    .line 77
    :array_29
    .array-data 4
        0x1100
        0x1100
        0x11a9
    .end array-data

    .line 78
    :array_2a
    .array-data 4
        0x1100
        0x1109
        0x11aa
    .end array-data

    .line 79
    :array_2b
    .array-data 4
        0x1102
        -0x1
        0x11ab
    .end array-data

    .line 80
    :array_2c
    .array-data 4
        0x1102
        0x110c
        0x11ac
    .end array-data

    .line 81
    :array_2d
    .array-data 4
        0x1102
        0x1112
        0x11ad
    .end array-data

    .line 82
    :array_2e
    .array-data 4
        0x1103
        -0x1
        0x11ae
    .end array-data

    .line 83
    :array_2f
    .array-data 4
        0x1105
        -0x1
        0x11af
    .end array-data

    .line 84
    :array_30
    .array-data 4
        0x1105
        0x1100
        0x11b0
    .end array-data

    .line 85
    :array_31
    .array-data 4
        0x1105
        0x1106
        0x11b1
    .end array-data

    .line 86
    :array_32
    .array-data 4
        0x1105
        0x1107
        0x11b2
    .end array-data

    .line 87
    :array_33
    .array-data 4
        0x1105
        0x1109
        0x11b3
    .end array-data

    .line 88
    :array_34
    .array-data 4
        0x1105
        0x1110
        0x11b4
    .end array-data

    .line 89
    :array_35
    .array-data 4
        0x1105
        0x1111
        0x11b5
    .end array-data

    .line 90
    :array_36
    .array-data 4
        0x1105
        0x1112
        0x11b6
    .end array-data

    .line 91
    :array_37
    .array-data 4
        0x1106
        -0x1
        0x11b7
    .end array-data

    .line 92
    :array_38
    .array-data 4
        0x1107
        -0x1
        0x11b8
    .end array-data

    .line 93
    :array_39
    .array-data 4
        0x1107
        0x1109
        0x11b9
    .end array-data

    .line 94
    :array_3a
    .array-data 4
        0x1109
        -0x1
        0x11ba
    .end array-data

    .line 95
    :array_3b
    .array-data 4
        0x1109
        0x1109
        0x11bb
    .end array-data

    .line 96
    :array_3c
    .array-data 4
        0x110b
        -0x1
        0x11bc
    .end array-data

    .line 97
    :array_3d
    .array-data 4
        0x110c
        -0x1
        0x11bd
    .end array-data

    .line 98
    :array_3e
    .array-data 4
        0x110e
        -0x1
        0x11be
    .end array-data

    .line 99
    :array_3f
    .array-data 4
        0x110f
        -0x1
        0x11bf
    .end array-data

    .line 100
    :array_40
    .array-data 4
        0x1110
        -0x1
        0x11c0
    .end array-data

    .line 101
    :array_41
    .array-data 4
        0x1111
        -0x1
        0x11c1
    .end array-data

    .line 102
    :array_42
    .array-data 4
        0x1112
        -0x1
        0x11c2
    .end array-data
.end method

.method private composeChosung(I)Z
    .locals 3
    .param p1, "code"    # I

    .prologue
    const/4 v2, -0x1

    .line 424
    iget v1, p0, Lcom/beyond/sui/AutomataX;->hanChosung:I

    if-ne v1, v2, :cond_0

    .line 426
    iput p1, p0, Lcom/beyond/sui/AutomataX;->hanChosung:I

    .line 435
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1

    .line 429
    :cond_0
    iget v1, p0, Lcom/beyond/sui/AutomataX;->hanChosung:I

    invoke-direct {p0, v1, p1}, Lcom/beyond/sui/AutomataX;->getComposedChosung(II)I

    move-result v0

    .line 430
    .local v0, "newCode":I
    if-ne v0, v2, :cond_1

    .line 431
    const/4 v1, 0x0

    goto :goto_1

    .line 433
    :cond_1
    iput v0, p0, Lcom/beyond/sui/AutomataX;->hanChosung:I

    goto :goto_0
.end method

.method private composeJongsung(I)Z
    .locals 6
    .param p1, "code"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v5, -0x1

    .line 457
    iget v4, p0, Lcom/beyond/sui/AutomataX;->hanJongsung:I

    if-ne v4, v5, :cond_0

    .line 459
    invoke-direct {p0, p1}, Lcom/beyond/sui/AutomataX;->convertCode2Jongsung(I)I

    move-result v3

    iput v3, p0, Lcom/beyond/sui/AutomataX;->hanJongsung:I

    .line 472
    :goto_0
    return v2

    .line 463
    :cond_0
    iget v4, p0, Lcom/beyond/sui/AutomataX;->hanJongsung:I

    invoke-direct {p0, v4}, Lcom/beyond/sui/AutomataX;->convertJongsung2Code(I)I

    move-result v0

    .line 464
    .local v0, "curJongCode":I
    if-ne v0, v5, :cond_1

    move v2, v3

    .line 465
    goto :goto_0

    .line 466
    :cond_1
    invoke-direct {p0, v0, p1}, Lcom/beyond/sui/AutomataX;->getComposedJongsung(II)I

    move-result v1

    .line 467
    .local v1, "newCode":I
    if-eq v1, v5, :cond_2

    .line 468
    iput v1, p0, Lcom/beyond/sui/AutomataX;->hanJongsung:I

    goto :goto_0

    :cond_2
    move v2, v3

    .line 472
    goto :goto_0
.end method

.method private composeJungsung(I)Z
    .locals 4
    .param p1, "code"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v3, -0x1

    .line 534
    iget v2, p0, Lcom/beyond/sui/AutomataX;->hanJungsung:I

    if-ne v2, v3, :cond_0

    .line 536
    iput p1, p0, Lcom/beyond/sui/AutomataX;->hanJungsung:I

    .line 545
    :goto_0
    return v1

    .line 540
    :cond_0
    iget v2, p0, Lcom/beyond/sui/AutomataX;->hanJungsung:I

    invoke-direct {p0, v2, p1}, Lcom/beyond/sui/AutomataX;->getComposedJungsung(II)I

    move-result v0

    .line 541
    .local v0, "newJungsung":I
    if-eq v0, v3, :cond_1

    .line 542
    iput v0, p0, Lcom/beyond/sui/AutomataX;->hanJungsung:I

    goto :goto_0

    .line 545
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private convertCode2Jongsung(I)I
    .locals 4
    .param p1, "code"    # I

    .prologue
    const/4 v1, -0x1

    .line 480
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    array-length v2, v2

    if-lt v0, v2, :cond_0

    .line 486
    :goto_1
    return v1

    .line 482
    :cond_0
    iget-object v2, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    aget-object v2, v2, v0

    const/4 v3, 0x0

    aget v2, v2, v3

    if-ne v2, p1, :cond_1

    iget-object v2, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    aget-object v2, v2, v0

    const/4 v3, 0x1

    aget v2, v2, v3

    if-ne v2, v1, :cond_1

    .line 483
    iget-object v1, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    aget-object v1, v1, v0

    const/4 v2, 0x2

    aget v1, v1, v2

    goto :goto_1

    .line 480
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private convertJongsung2Code(I)I
    .locals 4
    .param p1, "jongsungCode"    # I

    .prologue
    const/4 v1, -0x1

    .line 494
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    array-length v2, v2

    if-lt v0, v2, :cond_0

    .line 500
    :goto_1
    return v1

    .line 496
    :cond_0
    iget-object v2, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    aget-object v2, v2, v0

    const/4 v3, 0x2

    aget v2, v2, v3

    if-ne v2, p1, :cond_1

    iget-object v2, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    aget-object v2, v2, v0

    const/4 v3, 0x1

    aget v2, v2, v3

    if-ne v2, v1, :cond_1

    .line 497
    iget-object v1, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    aget-object v1, v1, v0

    const/4 v2, 0x0

    aget v1, v1, v2

    goto :goto_1

    .line 494
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private flushComposingCode()V
    .locals 3

    .prologue
    .line 293
    invoke-direct {p0}, Lcom/beyond/sui/AutomataX;->getComposingHangul()I

    move-result v0

    .line 294
    .local v0, "curCode":I
    invoke-direct {p0}, Lcom/beyond/sui/AutomataX;->reset()V

    .line 295
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 296
    iget-object v1, p0, Lcom/beyond/sui/AutomataX;->composedBuffer:Ljava/lang/StringBuffer;

    int-to-char v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 298
    :cond_0
    return-void
.end method

.method private getChosungChar(I)I
    .locals 1
    .param p1, "code"    # I

    .prologue
    .line 329
    packed-switch p1, :pswitch_data_0

    .line 351
    const/4 v0, -0x1

    :goto_0
    return v0

    .line 331
    :pswitch_0
    const/16 v0, 0x3131

    goto :goto_0

    .line 332
    :pswitch_1
    const/16 v0, 0x3132

    goto :goto_0

    .line 333
    :pswitch_2
    const/16 v0, 0x3134

    goto :goto_0

    .line 334
    :pswitch_3
    const/16 v0, 0x3137

    goto :goto_0

    .line 335
    :pswitch_4
    const/16 v0, 0x3138

    goto :goto_0

    .line 336
    :pswitch_5
    const/16 v0, 0x3139

    goto :goto_0

    .line 337
    :pswitch_6
    const/16 v0, 0x3141

    goto :goto_0

    .line 338
    :pswitch_7
    const/16 v0, 0x3142

    goto :goto_0

    .line 339
    :pswitch_8
    const/16 v0, 0x3143

    goto :goto_0

    .line 340
    :pswitch_9
    const/16 v0, 0x3145

    goto :goto_0

    .line 341
    :pswitch_a
    const/16 v0, 0x3146

    goto :goto_0

    .line 342
    :pswitch_b
    const/16 v0, 0x3147

    goto :goto_0

    .line 343
    :pswitch_c
    const/16 v0, 0x3148

    goto :goto_0

    .line 344
    :pswitch_d
    const/16 v0, 0x3149

    goto :goto_0

    .line 345
    :pswitch_e
    const/16 v0, 0x314a

    goto :goto_0

    .line 346
    :pswitch_f
    const/16 v0, 0x314b

    goto :goto_0

    .line 347
    :pswitch_10
    const/16 v0, 0x314c

    goto :goto_0

    .line 348
    :pswitch_11
    const/16 v0, 0x314d

    goto :goto_0

    .line 349
    :pswitch_12
    const/16 v0, 0x314e

    goto :goto_0

    .line 329
    :pswitch_data_0
    .packed-switch 0x1100
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
    .end packed-switch
.end method

.method private getComposedChosung(II)I
    .locals 3
    .param p1, "chosung1"    # I
    .param p2, "chosung2"    # I

    .prologue
    .line 444
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/beyond/sui/AutomataX;->hanChosungTable:[[I

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 449
    const/4 v1, -0x1

    :goto_1
    return v1

    .line 446
    :cond_0
    iget-object v1, p0, Lcom/beyond/sui/AutomataX;->hanChosungTable:[[I

    aget-object v1, v1, v0

    const/4 v2, 0x0

    aget v1, v1, v2

    if-ne v1, p1, :cond_1

    iget-object v1, p0, Lcom/beyond/sui/AutomataX;->hanChosungTable:[[I

    aget-object v1, v1, v0

    const/4 v2, 0x1

    aget v1, v1, v2

    if-ne v1, p2, :cond_1

    .line 447
    iget-object v1, p0, Lcom/beyond/sui/AutomataX;->hanChosungTable:[[I

    aget-object v1, v1, v0

    const/4 v2, 0x2

    aget v1, v1, v2

    goto :goto_1

    .line 444
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private getComposedJongsung(II)I
    .locals 3
    .param p1, "code1"    # I
    .param p2, "code2"    # I

    .prologue
    .line 505
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 510
    const/4 v1, -0x1

    :goto_1
    return v1

    .line 507
    :cond_0
    iget-object v1, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    aget-object v1, v1, v0

    const/4 v2, 0x0

    aget v1, v1, v2

    if-ne v1, p1, :cond_1

    iget-object v1, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    aget-object v1, v1, v0

    const/4 v2, 0x1

    aget v1, v1, v2

    if-ne v1, p2, :cond_1

    .line 508
    iget-object v1, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    aget-object v1, v1, v0

    const/4 v2, 0x2

    aget v1, v1, v2

    goto :goto_1

    .line 505
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private getComposedJungsung(II)I
    .locals 3
    .param p1, "code1"    # I
    .param p2, "code2"    # I

    .prologue
    .line 551
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/beyond/sui/AutomataX;->hanJungsungTable:[[I

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 558
    const/4 v1, -0x1

    :goto_1
    return v1

    .line 553
    :cond_0
    iget-object v1, p0, Lcom/beyond/sui/AutomataX;->hanJungsungTable:[[I

    aget-object v1, v1, v0

    const/4 v2, 0x0

    aget v1, v1, v2

    if-ne v1, p1, :cond_1

    iget-object v1, p0, Lcom/beyond/sui/AutomataX;->hanJungsungTable:[[I

    aget-object v1, v1, v0

    const/4 v2, 0x1

    aget v1, v1, v2

    if-ne v1, p2, :cond_1

    .line 555
    iget-object v1, p0, Lcom/beyond/sui/AutomataX;->hanJungsungTable:[[I

    aget-object v1, v1, v0

    const/4 v2, 0x2

    aget v1, v1, v2

    goto :goto_1

    .line 551
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private getComposingHangul()I
    .locals 5

    .prologue
    const/4 v3, -0x1

    .line 305
    iget v4, p0, Lcom/beyond/sui/AutomataX;->hanChosung:I

    if-eq v4, v3, :cond_2

    iget v4, p0, Lcom/beyond/sui/AutomataX;->hanJungsung:I

    if-eq v4, v3, :cond_2

    .line 308
    iget v4, p0, Lcom/beyond/sui/AutomataX;->hanChosung:I

    add-int/lit16 v0, v4, -0x1100

    .line 309
    .local v0, "choIndex":I
    iget v4, p0, Lcom/beyond/sui/AutomataX;->hanJungsung:I

    add-int/lit16 v2, v4, -0x1161

    .line 310
    .local v2, "jungIndex":I
    iget v4, p0, Lcom/beyond/sui/AutomataX;->hanJongsung:I

    if-ne v4, v3, :cond_1

    const/4 v1, 0x0

    .line 312
    .local v1, "jongIndex":I
    :goto_0
    const v3, 0xac00

    mul-int/lit8 v4, v0, 0x15

    mul-int/lit8 v4, v4, 0x1c

    add-int/2addr v3, v4

    mul-int/lit8 v4, v2, 0x1c

    add-int/2addr v3, v4

    add-int/2addr v3, v1

    .line 321
    .end local v0    # "choIndex":I
    .end local v1    # "jongIndex":I
    .end local v2    # "jungIndex":I
    :cond_0
    :goto_1
    return v3

    .line 310
    .restart local v0    # "choIndex":I
    .restart local v2    # "jungIndex":I
    :cond_1
    iget v3, p0, Lcom/beyond/sui/AutomataX;->hanJongsung:I

    add-int/lit16 v1, v3, -0x11a7

    goto :goto_0

    .line 313
    .end local v0    # "choIndex":I
    .end local v2    # "jungIndex":I
    :cond_2
    iget v4, p0, Lcom/beyond/sui/AutomataX;->hanChosung:I

    if-eq v4, v3, :cond_3

    .line 315
    iget v3, p0, Lcom/beyond/sui/AutomataX;->hanChosung:I

    invoke-direct {p0, v3}, Lcom/beyond/sui/AutomataX;->getChosungChar(I)I

    move-result v3

    goto :goto_1

    .line 316
    :cond_3
    iget v4, p0, Lcom/beyond/sui/AutomataX;->hanJungsung:I

    if-eq v4, v3, :cond_0

    .line 318
    iget v3, p0, Lcom/beyond/sui/AutomataX;->hanJungsung:I

    invoke-direct {p0, v3}, Lcom/beyond/sui/AutomataX;->getJungsungChar(I)I

    move-result v3

    goto :goto_1
.end method

.method static getInst()Lcom/beyond/sui/AutomataX;
    .locals 1

    .prologue
    .line 136
    sget-object v0, Lcom/beyond/sui/AutomataX;->instance:Lcom/beyond/sui/AutomataX;

    if-nez v0, :cond_0

    .line 137
    new-instance v0, Lcom/beyond/sui/AutomataX;

    invoke-direct {v0}, Lcom/beyond/sui/AutomataX;-><init>()V

    sput-object v0, Lcom/beyond/sui/AutomataX;->instance:Lcom/beyond/sui/AutomataX;

    .line 139
    :cond_0
    sget-object v0, Lcom/beyond/sui/AutomataX;->instance:Lcom/beyond/sui/AutomataX;

    return-object v0
.end method

.method private getJongsungChar(I)I
    .locals 1
    .param p1, "code"    # I

    .prologue
    .line 385
    packed-switch p1, :pswitch_data_0

    .line 415
    const/4 v0, -0x1

    :goto_0
    return v0

    .line 387
    :pswitch_0
    const/16 v0, 0x3131

    goto :goto_0

    .line 388
    :pswitch_1
    const/16 v0, 0x3132

    goto :goto_0

    .line 389
    :pswitch_2
    const/16 v0, 0x3133

    goto :goto_0

    .line 390
    :pswitch_3
    const/16 v0, 0x3134

    goto :goto_0

    .line 391
    :pswitch_4
    const/16 v0, 0x3135

    goto :goto_0

    .line 392
    :pswitch_5
    const/16 v0, 0x3136

    goto :goto_0

    .line 393
    :pswitch_6
    const/16 v0, 0x3137

    goto :goto_0

    .line 394
    :pswitch_7
    const/16 v0, 0x3139

    goto :goto_0

    .line 395
    :pswitch_8
    const/16 v0, 0x313a

    goto :goto_0

    .line 396
    :pswitch_9
    const/16 v0, 0x313b

    goto :goto_0

    .line 397
    :pswitch_a
    const/16 v0, 0x313c

    goto :goto_0

    .line 398
    :pswitch_b
    const/16 v0, 0x313d

    goto :goto_0

    .line 399
    :pswitch_c
    const/16 v0, 0x313e

    goto :goto_0

    .line 400
    :pswitch_d
    const/16 v0, 0x313f

    goto :goto_0

    .line 401
    :pswitch_e
    const/16 v0, 0x3140

    goto :goto_0

    .line 402
    :pswitch_f
    const/16 v0, 0x3141

    goto :goto_0

    .line 403
    :pswitch_10
    const/16 v0, 0x3142

    goto :goto_0

    .line 404
    :pswitch_11
    const/16 v0, 0x3144

    goto :goto_0

    .line 405
    :pswitch_12
    const/16 v0, 0x3145

    goto :goto_0

    .line 406
    :pswitch_13
    const/16 v0, 0x3146

    goto :goto_0

    .line 407
    :pswitch_14
    const/16 v0, 0x3147

    goto :goto_0

    .line 408
    :pswitch_15
    const/16 v0, 0x3148

    goto :goto_0

    .line 409
    :pswitch_16
    const/16 v0, 0x314a

    goto :goto_0

    .line 410
    :pswitch_17
    const/16 v0, 0x314b

    goto :goto_0

    .line 411
    :pswitch_18
    const/16 v0, 0x314c

    goto :goto_0

    .line 412
    :pswitch_19
    const/16 v0, 0x314d

    goto :goto_0

    .line 413
    :pswitch_1a
    const/16 v0, 0x314e

    goto :goto_0

    .line 385
    :pswitch_data_0
    .packed-switch 0x11a8
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
    .end packed-switch
.end method

.method private getJungsungChar(I)I
    .locals 1
    .param p1, "code"    # I

    .prologue
    .line 356
    packed-switch p1, :pswitch_data_0

    .line 380
    const/4 v0, -0x1

    :goto_0
    return v0

    .line 358
    :pswitch_0
    const/16 v0, 0x314f

    goto :goto_0

    .line 359
    :pswitch_1
    const/16 v0, 0x3150

    goto :goto_0

    .line 360
    :pswitch_2
    const/16 v0, 0x3151

    goto :goto_0

    .line 361
    :pswitch_3
    const/16 v0, 0x3152

    goto :goto_0

    .line 362
    :pswitch_4
    const/16 v0, 0x3153

    goto :goto_0

    .line 363
    :pswitch_5
    const/16 v0, 0x3154

    goto :goto_0

    .line 364
    :pswitch_6
    const/16 v0, 0x3155

    goto :goto_0

    .line 365
    :pswitch_7
    const/16 v0, 0x3156

    goto :goto_0

    .line 366
    :pswitch_8
    const/16 v0, 0x3157

    goto :goto_0

    .line 367
    :pswitch_9
    const/16 v0, 0x3158

    goto :goto_0

    .line 368
    :pswitch_a
    const/16 v0, 0x3159

    goto :goto_0

    .line 369
    :pswitch_b
    const/16 v0, 0x315a

    goto :goto_0

    .line 370
    :pswitch_c
    const/16 v0, 0x315b

    goto :goto_0

    .line 371
    :pswitch_d
    const/16 v0, 0x315c

    goto :goto_0

    .line 372
    :pswitch_e
    const/16 v0, 0x315d

    goto :goto_0

    .line 373
    :pswitch_f
    const/16 v0, 0x315e

    goto :goto_0

    .line 374
    :pswitch_10
    const/16 v0, 0x315f

    goto :goto_0

    .line 375
    :pswitch_11
    const/16 v0, 0x3160

    goto :goto_0

    .line 376
    :pswitch_12
    const/16 v0, 0x3161

    goto :goto_0

    .line 377
    :pswitch_13
    const/16 v0, 0x3162

    goto :goto_0

    .line 378
    :pswitch_14
    const/16 v0, 0x3163

    goto :goto_0

    .line 356
    :pswitch_data_0
    .packed-switch 0x1161
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
    .end packed-switch
.end method

.method private printState()V
    .locals 3

    .prologue
    .line 275
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "QQQ printState() ..."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 276
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "QQQ composedBuffer:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/beyond/sui/AutomataX;->composedBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", composing:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/beyond/sui/AutomataX;->getComposingHangul()I

    move-result v2

    int-to-char v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 277
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 278
    return-void
.end method

.method private reset()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 284
    iput v0, p0, Lcom/beyond/sui/AutomataX;->hanChosung:I

    .line 285
    iput v0, p0, Lcom/beyond/sui/AutomataX;->hanJungsung:I

    .line 286
    iput v0, p0, Lcom/beyond/sui/AutomataX;->hanJongsung:I

    .line 287
    return-void
.end method

.method private retrieveCodesFromJongsung(I[I)Z
    .locals 5
    .param p1, "jongCode"    # I
    .param p2, "codes"    # [I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 518
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v3, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    array-length v3, v3

    if-lt v0, v3, :cond_0

    move v1, v2

    .line 526
    :goto_1
    return v1

    .line 520
    :cond_0
    iget-object v3, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    aget-object v3, v3, v0

    const/4 v4, 0x2

    aget v3, v3, v4

    if-ne v3, p1, :cond_1

    .line 521
    iget-object v3, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    aget-object v3, v3, v0

    aget v3, v3, v2

    aput v3, p2, v2

    .line 522
    iget-object v2, p0, Lcom/beyond/sui/AutomataX;->hanJongsungTable:[[I

    aget-object v2, v2, v0

    aget v2, v2, v1

    aput v2, p2, v1

    goto :goto_1

    .line 518
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public getComposedString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/beyond/sui/AutomataX;->composedBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getComposingChar([C)Z
    .locals 3
    .param p1, "chars"    # [C

    .prologue
    const/4 v1, 0x0

    .line 154
    if-nez p1, :cond_0

    .line 155
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    throw v1

    .line 157
    :cond_0
    array-length v2, p1

    if-nez v2, :cond_1

    .line 158
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 160
    :cond_1
    invoke-direct {p0}, Lcom/beyond/sui/AutomataX;->getComposingHangul()I

    move-result v0

    .line 161
    .local v0, "composingCode":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_2

    .line 164
    :goto_0
    return v1

    .line 163
    :cond_2
    int-to-char v2, v0

    aput-char v2, p1, v1

    .line 164
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public init()V
    .locals 1

    .prologue
    .line 128
    new-instance v0, Lcom/beyond/sui/AutomataX;

    invoke-direct {v0}, Lcom/beyond/sui/AutomataX;-><init>()V

    sput-object v0, Lcom/beyond/sui/AutomataX;->instance:Lcom/beyond/sui/AutomataX;

    .line 129
    return-void
.end method

.method public processAutomata(II)Z
    .locals 8
    .param p1, "kind"    # I
    .param p2, "code"    # I

    .prologue
    const/4 v7, 0x3

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v6, -0x1

    .line 173
    const/16 v5, 0x7f

    if-ne p2, v5, :cond_2

    .line 175
    invoke-direct {p0}, Lcom/beyond/sui/AutomataX;->getComposingHangul()I

    move-result v1

    .line 176
    .local v1, "composeCode":I
    if-eq v1, v6, :cond_0

    .line 177
    invoke-direct {p0}, Lcom/beyond/sui/AutomataX;->reset()V

    .line 270
    .end local v1    # "composeCode":I
    :goto_0
    return v3

    .line 180
    .restart local v1    # "composeCode":I
    :cond_0
    iget-object v5, p0, Lcom/beyond/sui/AutomataX;->composedBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    .line 181
    .local v0, "bufLen":I
    if-lez v0, :cond_1

    .line 182
    iget-object v4, p0, Lcom/beyond/sui/AutomataX;->composedBuffer:Ljava/lang/StringBuffer;

    add-int/lit8 v5, v0, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    goto :goto_0

    :cond_1
    move v3, v4

    .line 186
    goto :goto_0

    .line 189
    .end local v0    # "bufLen":I
    .end local v1    # "composeCode":I
    :cond_2
    iget v5, p0, Lcom/beyond/sui/AutomataX;->inputMode:I

    and-int/2addr v5, p1

    if-nez v5, :cond_3

    .line 191
    iget v5, p0, Lcom/beyond/sui/AutomataX;->inputMode:I

    if-ne v5, v7, :cond_4

    .line 193
    invoke-direct {p0}, Lcom/beyond/sui/AutomataX;->flushComposingCode()V

    .line 194
    iput p1, p0, Lcom/beyond/sui/AutomataX;->inputMode:I

    .line 203
    :cond_3
    :goto_1
    sparse-switch p1, :sswitch_data_0

    move v3, v4

    .line 267
    goto :goto_0

    .line 195
    :cond_4
    and-int/lit8 v5, p1, 0x3

    if-eqz v5, :cond_5

    .line 197
    iput v7, p0, Lcom/beyond/sui/AutomataX;->inputMode:I

    goto :goto_1

    .line 199
    :cond_5
    iput p1, p0, Lcom/beyond/sui/AutomataX;->inputMode:I

    goto :goto_1

    .line 206
    :sswitch_0
    iget v4, p0, Lcom/beyond/sui/AutomataX;->hanJungsung:I

    if-ne v4, v6, :cond_7

    .line 209
    invoke-direct {p0, p2}, Lcom/beyond/sui/AutomataX;->composeChosung(I)Z

    move-result v4

    if-nez v4, :cond_6

    .line 211
    invoke-direct {p0}, Lcom/beyond/sui/AutomataX;->flushComposingCode()V

    .line 212
    invoke-direct {p0, p2}, Lcom/beyond/sui/AutomataX;->composeChosung(I)Z

    .line 269
    :cond_6
    :goto_2
    invoke-direct {p0}, Lcom/beyond/sui/AutomataX;->printState()V

    goto :goto_0

    .line 217
    :cond_7
    invoke-direct {p0, p2}, Lcom/beyond/sui/AutomataX;->composeJongsung(I)Z

    move-result v4

    if-nez v4, :cond_6

    .line 220
    invoke-direct {p0}, Lcom/beyond/sui/AutomataX;->flushComposingCode()V

    .line 221
    invoke-direct {p0, p2}, Lcom/beyond/sui/AutomataX;->composeChosung(I)Z

    goto :goto_2

    .line 226
    :sswitch_1
    iget v5, p0, Lcom/beyond/sui/AutomataX;->hanJongsung:I

    if-ne v5, v6, :cond_8

    .line 228
    invoke-direct {p0, p2}, Lcom/beyond/sui/AutomataX;->composeJungsung(I)Z

    move-result v4

    if-nez v4, :cond_6

    .line 230
    invoke-direct {p0}, Lcom/beyond/sui/AutomataX;->flushComposingCode()V

    .line 231
    invoke-direct {p0, p2}, Lcom/beyond/sui/AutomataX;->composeJungsung(I)Z

    goto :goto_2

    .line 236
    :cond_8
    const/4 v5, 0x2

    new-array v2, v5, [I

    .line 237
    .local v2, "jongCodes":[I
    iget v5, p0, Lcom/beyond/sui/AutomataX;->hanJongsung:I

    invoke-direct {p0, v5, v2}, Lcom/beyond/sui/AutomataX;->retrieveCodesFromJongsung(I[I)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 240
    aget v5, v2, v4

    if-eq v5, v6, :cond_9

    aget v5, v2, v3

    if-eq v5, v6, :cond_9

    .line 242
    aget v4, v2, v4

    invoke-direct {p0, v4}, Lcom/beyond/sui/AutomataX;->convertCode2Jongsung(I)I

    move-result v4

    iput v4, p0, Lcom/beyond/sui/AutomataX;->hanJongsung:I

    .line 243
    invoke-direct {p0}, Lcom/beyond/sui/AutomataX;->flushComposingCode()V

    .line 245
    aget v4, v2, v3

    invoke-direct {p0, v4}, Lcom/beyond/sui/AutomataX;->composeChosung(I)Z

    .line 246
    invoke-direct {p0, p2}, Lcom/beyond/sui/AutomataX;->composeJungsung(I)Z

    goto :goto_2

    .line 247
    :cond_9
    aget v5, v2, v4

    if-eq v5, v6, :cond_6

    aget v5, v2, v3

    if-ne v5, v6, :cond_6

    .line 250
    iput v6, p0, Lcom/beyond/sui/AutomataX;->hanJongsung:I

    .line 251
    invoke-direct {p0}, Lcom/beyond/sui/AutomataX;->flushComposingCode()V

    .line 253
    aget v4, v2, v4

    invoke-direct {p0, v4}, Lcom/beyond/sui/AutomataX;->composeChosung(I)Z

    .line 254
    invoke-direct {p0, p2}, Lcom/beyond/sui/AutomataX;->composeJungsung(I)Z

    goto :goto_2

    .line 264
    .end local v2    # "jongCodes":[I
    :sswitch_2
    iget-object v4, p0, Lcom/beyond/sui/AutomataX;->composedBuffer:Ljava/lang/StringBuffer;

    int-to-char v5, p2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 203
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x10 -> :sswitch_2
        0x20 -> :sswitch_2
        0x40 -> :sswitch_2
        0x80 -> :sswitch_2
    .end sparse-switch
.end method
