.class public Lcom/beyond/io/DateFormat;
.super Ljava/lang/Object;
.source "DateFormat.java"


# static fields
.field private static final LEAP_SUM_DAYS:[I

.field private static final SUM_DAYS:[I

.field private static timeOffHash:Ljava/util/Hashtable;


# instance fields
.field protected day:I

.field protected hour:I

.field protected milli:I

.field protected minute:I

.field protected month:I

.field protected second:I

.field protected timezoneOffset:I

.field protected year:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x5

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x0

    .line 36
    const/16 v0, 0xc

    new-array v0, v0, [I

    const/4 v1, 0x1

    const/16 v2, 0x1f

    aput v2, v0, v1

    const/16 v1, 0x3b

    aput v1, v0, v4

    const/16 v1, 0x5a

    aput v1, v0, v5

    const/16 v1, 0x78

    aput v1, v0, v6

    const/16 v1, 0x97

    aput v1, v0, v7

    const/4 v1, 0x6

    const/16 v2, 0xb5

    aput v2, v0, v1

    const/4 v1, 0x7

    const/16 v2, 0xd4

    aput v2, v0, v1

    const/16 v1, 0x8

    const/16 v2, 0xf3

    aput v2, v0, v1

    const/16 v1, 0x9

    const/16 v2, 0x111

    aput v2, v0, v1

    const/16 v1, 0xa

    const/16 v2, 0x130

    aput v2, v0, v1

    const/16 v1, 0xb

    const/16 v2, 0x14e

    aput v2, v0, v1

    .line 35
    sput-object v0, Lcom/beyond/io/DateFormat;->SUM_DAYS:[I

    .line 38
    const/16 v0, 0xc

    new-array v0, v0, [I

    const/4 v1, 0x1

    const/16 v2, 0x1f

    aput v2, v0, v1

    const/16 v1, 0x3c

    aput v1, v0, v4

    const/16 v1, 0x5b

    aput v1, v0, v5

    const/16 v1, 0x79

    aput v1, v0, v6

    const/16 v1, 0x98

    aput v1, v0, v7

    const/4 v1, 0x6

    const/16 v2, 0xb6

    aput v2, v0, v1

    const/4 v1, 0x7

    const/16 v2, 0xd5

    aput v2, v0, v1

    const/16 v1, 0x8

    const/16 v2, 0xf4

    aput v2, v0, v1

    const/16 v1, 0x9

    const/16 v2, 0x112

    aput v2, v0, v1

    const/16 v1, 0xa

    const/16 v2, 0x131

    aput v2, v0, v1

    const/16 v1, 0xb

    const/16 v2, 0x14f

    aput v2, v0, v1

    .line 37
    sput-object v0, Lcom/beyond/io/DateFormat;->LEAP_SUM_DAYS:[I

    .line 209
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    sput-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    .line 210
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "monday"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "tuesday"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "wednesday"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "thursday"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "friday"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "saturday"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "sunday"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "january"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "february"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v5}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "march"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v6}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "april"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v7}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "may"

    new-instance v2, Ljava/lang/Integer;

    const/4 v3, 0x6

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "june"

    new-instance v2, Ljava/lang/Integer;

    const/4 v3, 0x7

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "july"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0x8

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "august"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0x9

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "september"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0xa

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "october"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0xb

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "november"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0xc

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "december"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0xd

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "gmt"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0x2710

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "ut"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0x2710

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "utc"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0x2710

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "est"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0x283c

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "edt"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0x2800

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "cst"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0x2878

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "cdt"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0x283c

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "mst"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0x28b4

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "mdt"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0x2878

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "pst"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0x28f0

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    sget-object v0, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    const-string v1, "pdt"

    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0x28b4

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    invoke-direct {p0, p1}, Lcom/beyond/io/DateFormat;->Parse(Ljava/lang/String;)V

    .line 18
    return-void
.end method

.method private Parse(Ljava/lang/String;)V
    .locals 23
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 60
    const/16 v20, -0x1

    .line 61
    .local v20, "year":I
    const/4 v12, -0x1

    .line 62
    .local v12, "mon":I
    const/4 v9, -0x1

    .line 63
    .local v9, "mday":I
    const/4 v5, -0x1

    .line 64
    .local v5, "hour":I
    const/4 v11, -0x1

    .line 65
    .local v11, "min":I
    const/4 v15, -0x1

    .line 66
    .local v15, "sec":I
    const/4 v10, -0x1

    .line 67
    .local v10, "millis":I
    const/4 v3, -0x1

    .line 68
    .local v3, "c":I
    const/4 v6, 0x0

    .line 69
    .local v6, "i":I
    const/4 v13, -0x1

    .line 70
    .local v13, "n":I
    const/16 v19, -0x1

    .line 71
    .local v19, "wst":I
    const/16 v18, -0x1

    .line 72
    .local v18, "timezoneOffset":I
    const/4 v14, 0x0

    .line 75
    .local v14, "prevc":I
    if-nez p1, :cond_0

    .line 76
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 77
    :cond_0
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v8

    .line 78
    .local v8, "limit":I
    :cond_1
    :goto_0
    if-lt v6, v8, :cond_3

    .line 187
    const/16 v21, 0x62f

    move/from16 v0, v20

    move/from16 v1, v21

    if-lt v0, v1, :cond_2

    if-ltz v12, :cond_2

    if-gez v9, :cond_2e

    .line 188
    :cond_2
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 79
    :cond_3
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 80
    add-int/lit8 v6, v6, 0x1

    .line 81
    const/16 v21, 0x20

    move/from16 v0, v21

    if-le v3, v0, :cond_1

    const/16 v21, 0x2c

    move/from16 v0, v21

    if-eq v3, v0, :cond_1

    .line 83
    const/16 v21, 0x28

    move/from16 v0, v21

    if-ne v3, v0, :cond_6

    .line 84
    const/4 v4, 0x1

    .line 85
    .local v4, "depth":I
    :cond_4
    :goto_1
    if-ge v6, v8, :cond_1

    .line 86
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 87
    add-int/lit8 v6, v6, 0x1

    .line 88
    const/16 v21, 0x28

    move/from16 v0, v21

    if-ne v3, v0, :cond_5

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 89
    :cond_5
    const/16 v21, 0x29

    move/from16 v0, v21

    if-ne v3, v0, :cond_4

    .line 90
    add-int/lit8 v4, v4, -0x1

    if-gtz v4, :cond_4

    goto :goto_0

    .line 95
    .end local v4    # "depth":I
    :cond_6
    const/16 v21, 0x30

    move/from16 v0, v21

    if-gt v0, v3, :cond_1c

    const/16 v21, 0x39

    move/from16 v0, v21

    if-gt v3, v0, :cond_1c

    .line 96
    add-int/lit8 v7, v6, -0x1

    .line 97
    .local v7, "j":I
    :goto_2
    if-ge v6, v8, :cond_7

    const/16 v21, 0x30

    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    move/from16 v0, v21

    if-gt v0, v3, :cond_7

    const/16 v21, 0x39

    move/from16 v0, v21

    if-le v3, v0, :cond_9

    .line 99
    :cond_7
    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    .line 100
    const/16 v21, 0x2b

    move/from16 v0, v21

    if-eq v14, v0, :cond_8

    const/16 v21, 0x2d

    move/from16 v0, v21

    if-ne v14, v0, :cond_e

    if-ltz v20, :cond_e

    .line 102
    :cond_8
    if-eqz v18, :cond_a

    const/16 v21, -0x1

    move/from16 v0, v18

    move/from16 v1, v21

    if-eq v0, v1, :cond_a

    .line 103
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 98
    :cond_9
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 104
    :cond_a
    const/16 v21, 0x18

    move/from16 v0, v21

    if-ge v13, v0, :cond_d

    .line 105
    mul-int/lit8 v18, v13, 0x3c

    .line 108
    :goto_3
    const/16 v21, 0x2b

    move/from16 v0, v21

    if-ne v14, v0, :cond_b

    .line 109
    move/from16 v0, v18

    neg-int v0, v0

    move/from16 v18, v0

    .line 120
    :cond_b
    :goto_4
    if-gez v5, :cond_14

    .line 121
    int-to-byte v5, v13

    .line 127
    :cond_c
    :goto_5
    if-gez v12, :cond_16

    .line 128
    add-int/lit8 v21, v13, -0x1

    move/from16 v0, v21

    int-to-byte v12, v0

    .line 141
    :goto_6
    const/4 v14, 0x0

    goto/16 :goto_0

    .line 107
    :cond_d
    rem-int/lit8 v21, v13, 0x64

    div-int/lit8 v22, v13, 0x64

    mul-int/lit8 v22, v22, 0x3c

    add-int v18, v21, v22

    goto :goto_3

    .line 110
    :cond_e
    const/16 v21, 0x46

    move/from16 v0, v21

    if-lt v13, v0, :cond_13

    .line 111
    if-ltz v20, :cond_f

    .line 112
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 113
    :cond_f
    const/16 v21, 0x20

    move/from16 v0, v21

    if-le v3, v0, :cond_10

    const/16 v21, 0x2c

    move/from16 v0, v21

    if-eq v3, v0, :cond_10

    const/16 v21, 0x2f

    move/from16 v0, v21

    if-eq v3, v0, :cond_10

    if-lt v6, v8, :cond_12

    .line 114
    :cond_10
    const/16 v21, 0x64

    move/from16 v0, v21

    if-ge v13, v0, :cond_11

    add-int/lit16 v0, v13, 0x76c

    move/from16 v20, v0

    :goto_7
    goto :goto_4

    :cond_11
    move/from16 v20, v13

    goto :goto_7

    .line 116
    :cond_12
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 117
    :cond_13
    const/16 v21, 0x3a

    move/from16 v0, v21

    if-ne v3, v0, :cond_b

    .line 118
    if-ltz v5, :cond_b

    if-ltz v11, :cond_b

    .line 119
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 122
    :cond_14
    if-gez v11, :cond_15

    .line 123
    int-to-byte v11, v13

    goto :goto_5

    .line 124
    :cond_15
    const/16 v21, 0x2f

    move/from16 v0, v21

    if-ne v3, v0, :cond_c

    .line 125
    if-ltz v12, :cond_c

    if-ltz v9, :cond_c

    .line 126
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 129
    :cond_16
    if-gez v9, :cond_17

    .line 130
    int-to-byte v9, v13

    goto :goto_6

    .line 131
    :cond_17
    if-ge v6, v8, :cond_18

    const/16 v21, 0x2c

    move/from16 v0, v21

    if-eq v3, v0, :cond_18

    const/16 v21, 0x20

    move/from16 v0, v21

    if-le v3, v0, :cond_18

    const/16 v21, 0x2d

    move/from16 v0, v21

    if-eq v3, v0, :cond_18

    .line 132
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 133
    :cond_18
    if-ltz v5, :cond_19

    if-gez v11, :cond_19

    .line 134
    int-to-byte v11, v13

    goto/16 :goto_6

    .line 135
    :cond_19
    if-ltz v11, :cond_1a

    if-gez v15, :cond_1a

    .line 136
    int-to-byte v15, v13

    goto/16 :goto_6

    .line 137
    :cond_1a
    if-gez v9, :cond_1b

    .line 138
    int-to-byte v9, v13

    goto/16 :goto_6

    .line 140
    :cond_1b
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 142
    .end local v7    # "j":I
    :cond_1c
    const/16 v21, 0x2f

    move/from16 v0, v21

    if-eq v3, v0, :cond_1d

    const/16 v21, 0x3a

    move/from16 v0, v21

    if-eq v3, v0, :cond_1d

    const/16 v21, 0x2b

    move/from16 v0, v21

    if-eq v3, v0, :cond_1d

    const/16 v21, 0x2d

    move/from16 v0, v21

    if-ne v3, v0, :cond_1e

    .line 143
    :cond_1d
    move v14, v3

    goto/16 :goto_0

    .line 145
    :cond_1e
    add-int/lit8 v16, v6, -0x1

    .line 146
    .local v16, "st":I
    :goto_8
    if-lt v6, v8, :cond_20

    .line 152
    :cond_1f
    add-int/lit8 v21, v16, 0x1

    move/from16 v0, v21

    if-gt v6, v0, :cond_23

    .line 153
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 147
    :cond_20
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 148
    const/16 v21, 0x41

    move/from16 v0, v21

    if-gt v0, v3, :cond_21

    const/16 v21, 0x5a

    move/from16 v0, v21

    if-le v3, v0, :cond_22

    :cond_21
    const/16 v21, 0x61

    move/from16 v0, v21

    if-gt v0, v3, :cond_1f

    const/16 v21, 0x7a

    move/from16 v0, v21

    if-gt v3, v0, :cond_1f

    .line 150
    :cond_22
    add-int/lit8 v6, v6, 0x1

    goto :goto_8

    .line 155
    :cond_23
    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-virtual {v0, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v17

    .line 156
    .local v17, "str":Ljava/lang/String;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v17

    .line 158
    const-string v21, "am"

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_27

    .line 159
    const/16 v21, 0xc

    move/from16 v0, v21

    if-gt v5, v0, :cond_24

    const/16 v21, 0x1

    move/from16 v0, v21

    if-ge v5, v0, :cond_25

    .line 160
    :cond_24
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 161
    :cond_25
    const/16 v21, 0xc

    move/from16 v0, v21

    if-ne v5, v0, :cond_26

    .line 162
    const/4 v5, 0x0

    .line 184
    :cond_26
    :goto_9
    const/4 v14, 0x0

    goto/16 :goto_0

    .line 163
    :cond_27
    const-string v21, "pm"

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_2a

    .line 164
    const/16 v21, 0xc

    move/from16 v0, v21

    if-gt v5, v0, :cond_28

    const/16 v21, 0x1

    move/from16 v0, v21

    if-ge v5, v0, :cond_29

    .line 165
    :cond_28
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 166
    :cond_29
    const/16 v21, 0xc

    move/from16 v0, v21

    if-ge v5, v0, :cond_26

    .line 167
    add-int/lit8 v5, v5, 0xc

    goto :goto_9

    .line 168
    :cond_2a
    sget-object v21, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    if-nez v21, :cond_2b

    .line 169
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 171
    :cond_2b
    sget-object v21, Lcom/beyond/io/DateFormat;->timeOffHash:Ljava/util/Hashtable;

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/Integer;

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 173
    .local v2, "action":I
    if-eqz v2, :cond_26

    .line 174
    const/16 v21, 0xd

    move/from16 v0, v21

    if-gt v2, v0, :cond_2d

    .line 175
    if-gez v12, :cond_2c

    .line 176
    add-int/lit8 v21, v2, -0x2

    move/from16 v0, v21

    int-to-byte v12, v0

    goto :goto_9

    .line 178
    :cond_2c
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 180
    :cond_2d
    add-int/lit16 v0, v2, -0x2710

    move/from16 v18, v0

    goto :goto_9

    .line 189
    .end local v2    # "action":I
    .end local v16    # "st":I
    .end local v17    # "str":Ljava/lang/String;
    :cond_2e
    if-gez v15, :cond_2f

    .line 190
    const/4 v15, 0x0

    .line 191
    :cond_2f
    if-gez v11, :cond_30

    .line 192
    const/4 v11, 0x0

    .line 193
    :cond_30
    if-gez v5, :cond_31

    .line 194
    const/4 v5, 0x0

    .line 196
    :cond_31
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/beyond/io/DateFormat;->year:I

    .line 197
    move-object/from16 v0, p0

    iput v12, v0, Lcom/beyond/io/DateFormat;->month:I

    .line 198
    move-object/from16 v0, p0

    iput v9, v0, Lcom/beyond/io/DateFormat;->day:I

    .line 199
    move-object/from16 v0, p0

    iput v5, v0, Lcom/beyond/io/DateFormat;->hour:I

    .line 200
    move/from16 v0, v18

    neg-int v0, v0

    move/from16 v21, v0

    mul-int/lit8 v21, v21, 0x3c

    move/from16 v0, v21

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v21, v0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/beyond/io/DateFormat;->timezoneOffset:I

    .line 201
    move-object/from16 v0, p0

    iput v11, v0, Lcom/beyond/io/DateFormat;->minute:I

    .line 202
    move-object/from16 v0, p0

    iput v15, v0, Lcom/beyond/io/DateFormat;->second:I

    .line 203
    const/16 v21, 0x0

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/beyond/io/DateFormat;->milli:I

    .line 204
    return-void
.end method

.method private final computeDays(III)J
    .locals 10
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "day"    # I

    .prologue
    .line 42
    const-wide/16 v3, 0x0

    .line 43
    .local v3, "millis":J
    rem-int/lit8 v6, p1, 0x4

    if-nez v6, :cond_1

    const/4 v0, 0x1

    .line 46
    .local v0, "isLeap":Z
    :goto_0
    if-eqz v0, :cond_2

    rem-int/lit8 v6, p1, 0x64

    if-nez v6, :cond_0

    rem-int/lit16 v6, p1, 0x190

    if-nez v6, :cond_2

    :cond_0
    const/4 v0, 0x1

    .line 47
    :goto_1
    add-int/lit8 v5, p1, -0x1

    .line 48
    .local v5, "y":I
    if-ltz v5, :cond_3

    .line 49
    const-wide/16 v6, 0x16d

    int-to-long v8, v5

    mul-long/2addr v6, v8

    const-wide/32 v8, 0x1a444f

    add-long/2addr v6, v8

    div-int/lit8 v8, v5, 0x4

    int-to-long v8, v8

    add-long/2addr v6, v8

    div-int/lit16 v8, v5, 0x190

    add-int/lit8 v8, v8, 0x2

    int-to-long v8, v8

    add-long/2addr v6, v8

    div-int/lit8 v8, v5, 0x64

    int-to-long v8, v8

    sub-long v1, v6, v8

    .line 53
    .local v1, "julianDay":J
    :goto_2
    if-eqz v0, :cond_4

    sget-object v6, Lcom/beyond/io/DateFormat;->LEAP_SUM_DAYS:[I

    aget v6, v6, p2

    :goto_3
    int-to-long v6, v6

    add-long/2addr v1, v6

    .line 54
    int-to-long v6, p3

    add-long/2addr v1, v6

    .line 56
    return-wide v1

    .line 43
    .end local v0    # "isLeap":Z
    .end local v1    # "julianDay":J
    .end local v5    # "y":I
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 46
    .restart local v0    # "isLeap":Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    .line 51
    .restart local v5    # "y":I
    :cond_3
    const-wide/16 v6, 0x16d

    int-to-long v8, v5

    mul-long/2addr v6, v8

    const-wide/32 v8, 0x1a444f

    add-long/2addr v6, v8

    add-int/lit8 v8, v5, 0x1

    div-int/lit8 v8, v8, 0x4

    int-to-long v8, v8

    add-long/2addr v6, v8

    add-int/lit8 v8, v5, 0x1

    div-int/lit16 v8, v8, 0x190

    int-to-long v8, v8

    add-long/2addr v6, v8

    add-int/lit8 v8, v5, 0x1

    div-int/lit8 v8, v8, 0x64

    int-to-long v8, v8

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x1

    add-long v1, v6, v8

    .restart local v1    # "julianDay":J
    goto :goto_2

    .line 53
    :cond_4
    sget-object v6, Lcom/beyond/io/DateFormat;->SUM_DAYS:[I

    aget v6, v6, p2

    goto :goto_3
.end method

.method public static getMillisToGMT(Ljava/lang/String;)J
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 21
    new-instance v0, Lcom/beyond/io/DateFormat;

    invoke-direct {v0, p0}, Lcom/beyond/io/DateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/beyond/io/DateFormat;->getMilliTimesToGMT()J

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method getMilliTimesToGMT()J
    .locals 9

    .prologue
    .line 25
    iget v5, p0, Lcom/beyond/io/DateFormat;->year:I

    iget v6, p0, Lcom/beyond/io/DateFormat;->month:I

    iget v7, p0, Lcom/beyond/io/DateFormat;->day:I

    invoke-direct {p0, v5, v6, v7}, Lcom/beyond/io/DateFormat;->computeDays(III)J

    move-result-wide v0

    .line 29
    .local v0, "Days":J
    const-wide/32 v5, 0x253d8c

    sub-long v5, v0, v5

    const-wide/32 v7, 0x5265c00

    mul-long v2, v5, v7

    .line 30
    .local v2, "millis":J
    iget v5, p0, Lcom/beyond/io/DateFormat;->hour:I

    mul-int/lit8 v5, v5, 0x3c

    mul-int/lit8 v5, v5, 0x3c

    iget v6, p0, Lcom/beyond/io/DateFormat;->minute:I

    mul-int/lit8 v6, v6, 0x3c

    add-int/2addr v5, v6

    iget v6, p0, Lcom/beyond/io/DateFormat;->second:I

    add-int/2addr v5, v6

    mul-int/lit16 v5, v5, 0x3e8

    iget v6, p0, Lcom/beyond/io/DateFormat;->milli:I

    add-int v4, v5, v6

    .line 32
    .local v4, "millisInDay":I
    int-to-long v5, v4

    add-long/2addr v5, v2

    iget v7, p0, Lcom/beyond/io/DateFormat;->timezoneOffset:I

    int-to-long v7, v7

    sub-long/2addr v5, v7

    return-wide v5
.end method
