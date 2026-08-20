.class public Lnanoxml/XMLElement;
.super Ljava/lang/Object;
.source "XMLElement.java"


# static fields
.field public static final NANOXML_MAJOR_VERSION:I = 0x2

.field public static final NANOXML_MINOR_VERSION:I = 0x2

.field static final serialVersionUID:J = 0x5cc6040a57beee99L


# instance fields
.field private attributes:Ljava/util/Hashtable;

.field private charReadTooMuch:C

.field private children:Ljava/util/Vector;

.field private contents:Ljava/lang/String;

.field private entities:Ljava/util/Hashtable;

.field private ignoreCase:Z

.field private ignoreWhitespace:Z

.field private lineNr:I

.field private name:Ljava/lang/String;

.field private parserLineNr:I

.field private reader:Ljava/io/Reader;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 320
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, v2, v2}, Lnanoxml/XMLElement;-><init>(Ljava/util/Hashtable;ZZZ)V

    .line 321
    return-void
.end method

.method public constructor <init>(Ljava/util/Hashtable;)V
    .locals 2
    .param p1, "entities"    # Ljava/util/Hashtable;

    .prologue
    const/4 v1, 0x1

    .line 370
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v1, v1}, Lnanoxml/XMLElement;-><init>(Ljava/util/Hashtable;ZZZ)V

    .line 371
    return-void
.end method

.method public constructor <init>(Ljava/util/Hashtable;Z)V
    .locals 1
    .param p1, "entities"    # Ljava/util/Hashtable;
    .param p2, "skipLeadingWhitespace"    # Z

    .prologue
    const/4 v0, 0x1

    .line 458
    invoke-direct {p0, p1, p2, v0, v0}, Lnanoxml/XMLElement;-><init>(Ljava/util/Hashtable;ZZZ)V

    .line 459
    return-void
.end method

.method public constructor <init>(Ljava/util/Hashtable;ZZ)V
    .locals 1
    .param p1, "entities"    # Ljava/util/Hashtable;
    .param p2, "skipLeadingWhitespace"    # Z
    .param p3, "ignoreCase"    # Z

    .prologue
    .line 507
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0, p3}, Lnanoxml/XMLElement;-><init>(Ljava/util/Hashtable;ZZZ)V

    .line 508
    return-void
.end method

.method protected constructor <init>(Ljava/util/Hashtable;ZZZ)V
    .locals 9
    .param p1, "entities"    # Ljava/util/Hashtable;
    .param p2, "skipLeadingWhitespace"    # Z
    .param p3, "fillBasicConversionTable"    # Z
    .param p4, "ignoreCase"    # Z

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 561
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 563
    iput-boolean p2, p0, Lnanoxml/XMLElement;->ignoreWhitespace:Z

    .line 564
    iput-boolean p4, p0, Lnanoxml/XMLElement;->ignoreCase:Z

    .line 565
    const/4 v3, 0x0

    iput-object v3, p0, Lnanoxml/XMLElement;->name:Ljava/lang/String;

    .line 566
    const-string v3, ""

    iput-object v3, p0, Lnanoxml/XMLElement;->contents:Ljava/lang/String;

    .line 567
    new-instance v3, Ljava/util/Hashtable;

    invoke-direct {v3}, Ljava/util/Hashtable;-><init>()V

    iput-object v3, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    .line 568
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    iput-object v3, p0, Lnanoxml/XMLElement;->children:Ljava/util/Vector;

    .line 569
    iput-object p1, p0, Lnanoxml/XMLElement;->entities:Ljava/util/Hashtable;

    .line 570
    iput v7, p0, Lnanoxml/XMLElement;->lineNr:I

    .line 572
    iget-object v3, p0, Lnanoxml/XMLElement;->entities:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 574
    .local v0, "en":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_2

    .line 584
    if-eqz p3, :cond_1

    .line 585
    iget-object v3, p0, Lnanoxml/XMLElement;->entities:Ljava/util/Hashtable;

    const-string v4, "amp"

    new-array v5, v8, [C

    const/16 v6, 0x26

    aput-char v6, v5, v7

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 586
    iget-object v3, p0, Lnanoxml/XMLElement;->entities:Ljava/util/Hashtable;

    const-string v4, "quot"

    new-array v5, v8, [C

    const/16 v6, 0x22

    aput-char v6, v5, v7

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 587
    iget-object v3, p0, Lnanoxml/XMLElement;->entities:Ljava/util/Hashtable;

    const-string v4, "apos"

    new-array v5, v8, [C

    const/16 v6, 0x27

    aput-char v6, v5, v7

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 588
    iget-object v3, p0, Lnanoxml/XMLElement;->entities:Ljava/util/Hashtable;

    const-string v4, "lt"

    new-array v5, v8, [C

    const/16 v6, 0x3c

    aput-char v6, v5, v7

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 589
    iget-object v3, p0, Lnanoxml/XMLElement;->entities:Ljava/util/Hashtable;

    const-string v4, "gt"

    new-array v5, v8, [C

    const/16 v6, 0x3e

    aput-char v6, v5, v7

    invoke-virtual {v3, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 591
    :cond_1
    return-void

    .line 575
    :cond_2
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    .line 576
    .local v1, "key":Ljava/lang/Object;
    iget-object v3, p0, Lnanoxml/XMLElement;->entities:Ljava/util/Hashtable;

    invoke-virtual {v3, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 578
    .local v2, "value":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 579
    check-cast v2, Ljava/lang/String;

    .end local v2    # "value":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 580
    .local v2, "value":[C
    iget-object v3, p0, Lnanoxml/XMLElement;->entities:Ljava/util/Hashtable;

    invoke-virtual {v3, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public constructor <init>(Z)V
    .locals 2
    .param p1, "skipLeadingWhitespace"    # Z

    .prologue
    const/4 v1, 0x1

    .line 409
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    invoke-direct {p0, v0, p1, v1, v1}, Lnanoxml/XMLElement;-><init>(Ljava/util/Hashtable;ZZZ)V

    .line 410
    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 2
    .param p1, "skipLeadingWhitespace"    # Z
    .param p2, "ignoreCase"    # Z

    .prologue
    .line 324
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    const/4 v1, 0x1

    invoke-direct {p0, v0, p1, v1, p2}, Lnanoxml/XMLElement;-><init>(Ljava/util/Hashtable;ZZZ)V

    .line 325
    return-void
.end method

.method private writeIdented(Ljava/io/Writer;I)V
    .locals 11
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "level"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x22

    const/16 v9, 0x3c

    const/16 v8, 0x2f

    const/16 v7, 0xa

    const/16 v6, 0x3e

    .line 2544
    iget-object v5, p0, Lnanoxml/XMLElement;->name:Ljava/lang/String;

    if-nez v5, :cond_0

    .line 2545
    iget-object v5, p0, Lnanoxml/XMLElement;->contents:Ljava/lang/String;

    invoke-virtual {p0, p1, v5}, Lnanoxml/XMLElement;->writeEncoded(Ljava/io/Writer;Ljava/lang/String;)V

    .line 2610
    :goto_0
    return-void

    .line 2549
    :cond_0
    const/4 v2, 0x1

    .line 2552
    .local v2, "ident":Z
    invoke-direct {p0, p1, p2}, Lnanoxml/XMLElement;->writeTabs(Ljava/io/Writer;I)V

    .line 2555
    invoke-virtual {p1, v9}, Ljava/io/Writer;->write(I)V

    .line 2556
    iget-object v5, p0, Lnanoxml/XMLElement;->name:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 2558
    iget-object v5, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v5}, Ljava/util/Hashtable;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 2559
    iget-object v5, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v5}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 2561
    .local v1, "en":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-nez v5, :cond_2

    .line 2573
    .end local v1    # "en":Ljava/util/Enumeration;
    :cond_1
    iget-object v5, p0, Lnanoxml/XMLElement;->contents:Ljava/lang/String;

    if-eqz v5, :cond_3

    iget-object v5, p0, Lnanoxml/XMLElement;->contents:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_3

    .line 2574
    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(I)V

    .line 2575
    iget-object v5, p0, Lnanoxml/XMLElement;->contents:Ljava/lang/String;

    invoke-virtual {p0, p1, v5}, Lnanoxml/XMLElement;->writeEncoded(Ljava/io/Writer;Ljava/lang/String;)V

    .line 2576
    invoke-virtual {p1, v9}, Ljava/io/Writer;->write(I)V

    .line 2577
    invoke-virtual {p1, v8}, Ljava/io/Writer;->write(I)V

    .line 2578
    iget-object v5, p0, Lnanoxml/XMLElement;->name:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 2579
    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(I)V

    .line 2581
    invoke-virtual {p1, v7}, Ljava/io/Writer;->write(I)V

    goto :goto_0

    .line 2562
    .restart local v1    # "en":Ljava/util/Enumeration;
    :cond_2
    const/16 v5, 0x20

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V

    .line 2563
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 2564
    .local v3, "key":Ljava/lang/String;
    iget-object v5, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v5, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 2565
    .local v4, "value":Ljava/lang/String;
    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 2566
    const/16 v5, 0x3d

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V

    .line 2567
    invoke-virtual {p1, v10}, Ljava/io/Writer;->write(I)V

    .line 2568
    invoke-virtual {p0, p1, v4}, Lnanoxml/XMLElement;->writeEncoded(Ljava/io/Writer;Ljava/lang/String;)V

    .line 2569
    invoke-virtual {p1, v10}, Ljava/io/Writer;->write(I)V

    goto :goto_1

    .line 2583
    .end local v1    # "en":Ljava/util/Enumeration;
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :cond_3
    iget-object v5, p0, Lnanoxml/XMLElement;->children:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 2584
    invoke-virtual {p1, v8}, Ljava/io/Writer;->write(I)V

    .line 2585
    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(I)V

    .line 2587
    invoke-virtual {p1, v7}, Ljava/io/Writer;->write(I)V

    goto :goto_0

    .line 2590
    :cond_4
    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(I)V

    .line 2592
    invoke-virtual {p1, v7}, Ljava/io/Writer;->write(I)V

    .line 2594
    invoke-virtual {p0}, Lnanoxml/XMLElement;->enumerateChildren()Ljava/util/Enumeration;

    move-result-object v1

    .line 2595
    .restart local v1    # "en":Ljava/util/Enumeration;
    :goto_2
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-nez v5, :cond_5

    .line 2600
    invoke-direct {p0, p1, p2}, Lnanoxml/XMLElement;->writeTabs(Ljava/io/Writer;I)V

    .line 2602
    invoke-virtual {p1, v9}, Ljava/io/Writer;->write(I)V

    .line 2603
    invoke-virtual {p1, v8}, Ljava/io/Writer;->write(I)V

    .line 2604
    iget-object v5, p0, Lnanoxml/XMLElement;->name:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 2605
    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(I)V

    .line 2607
    invoke-virtual {p1, v7}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_0

    .line 2596
    :cond_5
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnanoxml/XMLElement;

    .line 2597
    .local v0, "child":Lnanoxml/XMLElement;
    add-int/lit8 v5, p2, 0x1

    invoke-direct {v0, p1, v5}, Lnanoxml/XMLElement;->writeIdented(Ljava/io/Writer;I)V

    goto :goto_2
.end method

.method private writeTabs(Ljava/io/Writer;I)V
    .locals 2
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "level"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2538
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p2, :cond_0

    .line 2541
    return-void

    .line 2539
    :cond_0
    const/16 v1, 0x9

    invoke-virtual {p1, v1}, Ljava/io/Writer;->write(I)V

    .line 2538
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public addChild(Ljava/lang/String;)Lnanoxml/XMLElement;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 634
    new-instance v0, Lnanoxml/XMLElement;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lnanoxml/XMLElement;-><init>(ZZ)V

    .line 635
    .local v0, "xml":Lnanoxml/XMLElement;
    invoke-virtual {v0, p1}, Lnanoxml/XMLElement;->setName(Ljava/lang/String;)V

    .line 636
    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->addChild(Lnanoxml/XMLElement;)V

    .line 637
    return-object v0
.end method

.method public addChild(Ljava/lang/String;Ljava/lang/String;)Lnanoxml/XMLElement;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 641
    invoke-virtual {p0, p1}, Lnanoxml/XMLElement;->addChild(Ljava/lang/String;)Lnanoxml/XMLElement;

    move-result-object v0

    .line 642
    .local v0, "xml":Lnanoxml/XMLElement;
    invoke-virtual {v0, p2}, Lnanoxml/XMLElement;->setContent(Ljava/lang/String;)V

    .line 643
    return-object v0
.end method

.method public addChild(Lnanoxml/XMLElement;)V
    .locals 1
    .param p1, "child"    # Lnanoxml/XMLElement;

    .prologue
    .line 630
    iget-object v0, p0, Lnanoxml/XMLElement;->children:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 631
    return-void
.end method

.method public addProperty(Ljava/lang/String;D)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # D

    .prologue
    .line 853
    invoke-virtual {p0, p1, p2, p3}, Lnanoxml/XMLElement;->setDoubleAttribute(Ljava/lang/String;D)V

    .line 854
    return-void
.end method

.method public addProperty(Ljava/lang/String;I)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 785
    invoke-virtual {p0, p1, p2}, Lnanoxml/XMLElement;->setIntAttribute(Ljava/lang/String;I)V

    .line 786
    return-void
.end method

.method public addProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 717
    invoke-virtual {p0, p1, p2}, Lnanoxml/XMLElement;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 718
    return-void
.end method

.method protected checkCDATA(Ljava/lang/StringBuffer;)Z
    .locals 8
    .param p1, "buf"    # Ljava/lang/StringBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/16 v6, 0x5d

    .line 2881
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v0

    .line 2883
    .local v0, "ch":C
    const/16 v5, 0x5b

    if-eq v0, v5, :cond_0

    .line 2884
    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->unreadChar(C)V

    .line 2885
    invoke-virtual {p0, v3}, Lnanoxml/XMLElement;->skipSpecialTag(I)V

    .line 2931
    :goto_0
    return v3

    .line 2887
    :cond_0
    const-string v5, "CDATA["

    invoke-virtual {p0, v5}, Lnanoxml/XMLElement;->checkLiteral(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 2888
    invoke-virtual {p0, v4}, Lnanoxml/XMLElement;->skipSpecialTag(I)V

    goto :goto_0

    .line 2891
    :cond_1
    const/4 v1, 0x0

    .line 2893
    .local v1, "delimiterCharsSkipped":I
    :goto_1
    const/4 v3, 0x3

    if-lt v1, v3, :cond_2

    move v3, v4

    .line 2931
    goto :goto_0

    .line 2894
    :cond_2
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v0

    .line 2895
    sparse-switch v0, :sswitch_data_0

    .line 2922
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    if-lt v2, v1, :cond_6

    .line 2926
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 2927
    const/4 v1, 0x0

    goto :goto_1

    .line 2897
    .end local v2    # "i":I
    :sswitch_0
    if-ge v1, v7, :cond_3

    .line 2898
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2900
    :cond_3
    invoke-virtual {p1, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 2901
    invoke-virtual {p1, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 2902
    const/4 v1, 0x0

    .line 2905
    goto :goto_1

    .line 2908
    :sswitch_1
    if-ge v1, v7, :cond_5

    .line 2909
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_3
    if-lt v2, v1, :cond_4

    .line 2913
    const/4 v1, 0x0

    .line 2914
    const/16 v3, 0x3e

    invoke-virtual {p1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 2910
    :cond_4
    invoke-virtual {p1, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 2909
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 2916
    .end local v2    # "i":I
    :cond_5
    const/4 v1, 0x3

    .line 2919
    goto :goto_1

    .line 2923
    .restart local v2    # "i":I
    :cond_6
    invoke-virtual {p1, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 2922
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 2895
    :sswitch_data_0
    .sparse-switch
        0x3e -> :sswitch_1
        0x5d -> :sswitch_0
    .end sparse-switch
.end method

.method protected checkLiteral(Ljava/lang/String;)Z
    .locals 4
    .param p1, "literal"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3052
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 3054
    .local v1, "length":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 3060
    const/4 v2, 0x1

    :goto_1
    return v2

    .line 3055
    :cond_0
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_1

    .line 3056
    const/4 v2, 0x0

    goto :goto_1

    .line 3054
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public countChildren()I
    .locals 1

    .prologue
    .line 875
    iget-object v0, p0, Lnanoxml/XMLElement;->children:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    return v0
.end method

.method protected createAnotherElement()Lnanoxml/XMLElement;
    .locals 5

    .prologue
    .line 2445
    new-instance v0, Lnanoxml/XMLElement;

    iget-object v1, p0, Lnanoxml/XMLElement;->entities:Ljava/util/Hashtable;

    iget-boolean v2, p0, Lnanoxml/XMLElement;->ignoreWhitespace:Z

    const/4 v3, 0x0

    iget-boolean v4, p0, Lnanoxml/XMLElement;->ignoreCase:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lnanoxml/XMLElement;-><init>(Ljava/util/Hashtable;ZZZ)V

    return-object v0
.end method

.method public enumerateAttributeNames()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 931
    iget-object v0, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public enumerateChildren()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 963
    iget-object v0, p0, Lnanoxml/XMLElement;->children:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public enumeratePropertyNames()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 941
    invoke-virtual {p0}, Lnanoxml/XMLElement;->enumerateAttributeNames()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method protected expectedInput(Ljava/lang/String;)Lnanoxml/XMLParseException;
    .locals 4
    .param p1, "charSet"    # Ljava/lang/String;

    .prologue
    .line 3392
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Expected: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3393
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Lnanoxml/XMLParseException;

    invoke-virtual {p0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lnanoxml/XMLElement;->parserLineNr:I

    invoke-direct {v1, v2, v3, v0}, Lnanoxml/XMLParseException;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-object v1
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1153
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lnanoxml/XMLElement;->getAttribute(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getAttribute(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 1189
    iget-boolean v1, p0, Lnanoxml/XMLElement;->ignoreCase:Z

    if-eqz v1, :cond_0

    .line 1190
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 1193
    :cond_0
    iget-object v1, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1195
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_1

    .line 1196
    move-object v0, p2

    .line 1199
    :cond_1
    return-object v0
.end method

.method public getAttribute(Ljava/lang/String;Ljava/util/Hashtable;Ljava/lang/String;Z)Ljava/lang/Object;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "valueSet"    # Ljava/util/Hashtable;
    .param p3, "defaultKey"    # Ljava/lang/String;
    .param p4, "allowLiterals"    # Z

    .prologue
    .line 1246
    iget-boolean v2, p0, Lnanoxml/XMLElement;->ignoreCase:Z

    if-eqz v2, :cond_0

    .line 1247
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 1250
    :cond_0
    iget-object v2, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1253
    .local v0, "key":Ljava/lang/Object;
    if-nez v0, :cond_1

    .line 1254
    move-object v0, p3

    .line 1257
    .end local v0    # "key":Ljava/lang/Object;
    :cond_1
    invoke-virtual {p2, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 1259
    .local v1, "result":Ljava/lang/Object;
    if-nez v1, :cond_2

    .line 1260
    if-eqz p4, :cond_3

    .end local v1    # "result":Ljava/lang/Object;
    .local v0, "result":Ljava/lang/Object;
    move-object v1, v0

    .line 1267
    .end local v0    # "result":Ljava/lang/Object;
    .restart local v1    # "result":Ljava/lang/Object;
    :cond_2
    return-object v1

    .line 1263
    :cond_3
    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lnanoxml/XMLElement;->invalidValue(Ljava/lang/String;Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v2

    throw v2
.end method

.method public getBooleanAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "trueValue"    # Ljava/lang/String;
    .param p3, "falseValue"    # Ljava/lang/String;
    .param p4, "defaultValue"    # Z

    .prologue
    .line 1751
    iget-boolean v1, p0, Lnanoxml/XMLElement;->ignoreCase:Z

    if-eqz v1, :cond_0

    .line 1752
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 1755
    :cond_0
    iget-object v1, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1757
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_1

    .line 1762
    .end local p4    # "defaultValue":Z
    :goto_0
    return p4

    .line 1759
    .restart local p4    # "defaultValue":Z
    :cond_1
    invoke-virtual {v0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1760
    const/4 p4, 0x1

    goto :goto_0

    .line 1761
    :cond_2
    invoke-virtual {v0, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1762
    const/4 p4, 0x0

    goto :goto_0

    .line 1764
    :cond_3
    check-cast v0, Ljava/lang/String;

    .end local v0    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p1, v0}, Lnanoxml/XMLElement;->invalidValue(Ljava/lang/String;Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v1

    throw v1
.end method

.method public getBooleanAttribute(Ljava/lang/String;Z)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Z

    .prologue
    .line 1769
    const-string v0, "true"

    const-string v1, "false"

    invoke-virtual {p0, p1, v0, v1, p2}, Lnanoxml/XMLElement;->getBooleanAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getChild(Ljava/lang/String;)Lnanoxml/XMLElement;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 998
    iget-object v2, p0, Lnanoxml/XMLElement;->children:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "en":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1004
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 999
    :cond_1
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnanoxml/XMLElement;

    .line 1000
    .local v0, "el":Lnanoxml/XMLElement;
    invoke-virtual {v0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method

.method public getChild(Ljava/lang/String;Ljava/lang/String;)Lnanoxml/XMLElement;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "attrValue"    # Ljava/lang/String;

    .prologue
    .line 1027
    iget-object v3, p0, Lnanoxml/XMLElement;->children:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "en":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_2

    .line 1034
    const/4 v0, 0x0

    :cond_1
    :goto_0
    return-object v0

    .line 1028
    :cond_2
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnanoxml/XMLElement;

    .line 1029
    .local v0, "el":Lnanoxml/XMLElement;
    const-string v3, "name"

    invoke-virtual {v0, v3}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1030
    .local v1, "elAttrValue":Ljava/lang/String;
    invoke-virtual {v0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    if-eq p2, v1, :cond_1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0
.end method

.method public getChild(Ljava/lang/String;Ljava/util/Map;)Lnanoxml/XMLElement;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "equalAttributesNameValue"    # Ljava/util/Map;

    .prologue
    .line 1038
    iget-object v5, p0, Lnanoxml/XMLElement;->children:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .local v3, "en":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-nez v5, :cond_2

    .line 1058
    const/4 v2, 0x0

    :cond_1
    return-object v2

    .line 1039
    :cond_2
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnanoxml/XMLElement;

    .line 1040
    .local v2, "el":Lnanoxml/XMLElement;
    invoke-virtual {v2}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1041
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i":Ljava/util/Iterator;
    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1042
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1043
    .local v0, "atrNameValue":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v2, v5}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1044
    .local v1, "attrValue":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_4

    .line 1045
    if-eqz v1, :cond_3

    goto :goto_0

    .line 1051
    :cond_4
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    goto :goto_0
.end method

.method public getChildCount(Ljava/lang/String;)I
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1016
    const/4 v0, 0x0

    .line 1017
    .local v0, "cnt":I
    iget-object v3, p0, Lnanoxml/XMLElement;->children:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "en":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1023
    return v0

    .line 1018
    :cond_1
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnanoxml/XMLElement;

    .line 1019
    .local v1, "el":Lnanoxml/XMLElement;
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1020
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getChildInteger(Ljava/lang/String;I)I
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 1062
    invoke-virtual {p0, p1}, Lnanoxml/XMLElement;->getChild(Ljava/lang/String;)Lnanoxml/XMLElement;

    move-result-object v1

    .line 1063
    .local v1, "xml":Lnanoxml/XMLElement;
    if-nez v1, :cond_0

    .line 1069
    .end local p2    # "defaultValue":I
    :goto_0
    return p2

    .line 1067
    .restart local p2    # "defaultValue":I
    :cond_0
    :try_start_0
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getContent()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p2

    goto :goto_0

    .line 1068
    :catch_0
    move-exception v0

    .line 1069
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public getChildOrNew(Ljava/lang/String;)Lnanoxml/XMLElement;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1008
    invoke-virtual {p0, p1}, Lnanoxml/XMLElement;->getChild(Ljava/lang/String;)Lnanoxml/XMLElement;

    move-result-object v0

    .line 1009
    .local v0, "c":Lnanoxml/XMLElement;
    if-nez v0, :cond_0

    .line 1010
    invoke-virtual {p0, p1}, Lnanoxml/XMLElement;->addChild(Ljava/lang/String;)Lnanoxml/XMLElement;

    move-result-object v0

    .line 1012
    :cond_0
    return-object v0
.end method

.method public getChildString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 1074
    invoke-virtual {p0, p1}, Lnanoxml/XMLElement;->getChild(Ljava/lang/String;)Lnanoxml/XMLElement;

    move-result-object v1

    .line 1075
    .local v1, "xml":Lnanoxml/XMLElement;
    if-nez v1, :cond_1

    .line 1082
    .end local p2    # "defaultValue":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p2

    .line 1078
    .restart local p2    # "defaultValue":Ljava/lang/String;
    :cond_1
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getContent()Ljava/lang/String;

    move-result-object v0

    .line 1079
    .local v0, "v":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    move-object p2, v0

    .line 1082
    goto :goto_0
.end method

.method public getChildren()Ljava/util/Vector;
    .locals 2

    .prologue
    .line 986
    :try_start_0
    iget-object v1, p0, Lnanoxml/XMLElement;->children:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Vector;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 990
    :goto_0
    return-object v1

    .line 987
    :catch_0
    move-exception v0

    .line 990
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getContent()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1102
    iget-object v0, p0, Lnanoxml/XMLElement;->contents:Ljava/lang/String;

    return-object v0
.end method

.method public getContents()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1092
    invoke-virtual {p0}, Lnanoxml/XMLElement;->getContent()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDoubleAttribute(Ljava/lang/String;)D
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1584
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lnanoxml/XMLElement;->getDoubleAttribute(Ljava/lang/String;D)D

    move-result-wide v0

    return-wide v0
.end method

.method public getDoubleAttribute(Ljava/lang/String;D)D
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # D

    .prologue
    .line 1618
    iget-boolean v2, p0, Lnanoxml/XMLElement;->ignoreCase:Z

    if-eqz v2, :cond_0

    .line 1619
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 1622
    :cond_0
    iget-object v2, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1624
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 1628
    .end local p2    # "defaultValue":D
    :goto_0
    return-wide p2

    .restart local p2    # "defaultValue":D
    :cond_1
    :try_start_0
    invoke-static {v1}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide p2

    goto :goto_0

    .line 1629
    :catch_0
    move-exception v0

    .line 1630
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {p0, p1, v1}, Lnanoxml/XMLElement;->invalidValue(Ljava/lang/String;Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v2

    throw v2
.end method

.method public getDoubleAttribute(Ljava/lang/String;Ljava/util/Hashtable;Ljava/lang/String;Z)D
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "valueSet"    # Ljava/util/Hashtable;
    .param p3, "defaultKey"    # Ljava/lang/String;
    .param p4, "allowLiteralNumbers"    # Z

    .prologue
    .line 1680
    iget-boolean v4, p0, Lnanoxml/XMLElement;->ignoreCase:Z

    if-eqz v4, :cond_0

    .line 1681
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 1684
    :cond_0
    iget-object v4, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v4, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1687
    .local v2, "key":Ljava/lang/Object;
    if-nez v2, :cond_1

    .line 1688
    move-object v2, p3

    .line 1692
    .end local v2    # "key":Ljava/lang/Object;
    :cond_1
    :try_start_0
    invoke-virtual {p2, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1697
    .local v3, "result":Ljava/lang/Double;
    if-nez v3, :cond_3

    .line 1698
    if-nez p4, :cond_2

    .line 1699
    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, p1, v2}, Lnanoxml/XMLElement;->invalidValue(Ljava/lang/String;Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v4

    throw v4

    .line 1693
    .end local v3    # "result":Ljava/lang/Double;
    :catch_0
    move-exception v1

    .line 1694
    .local v1, "e":Ljava/lang/ClassCastException;
    invoke-virtual {p0, p1}, Lnanoxml/XMLElement;->invalidValueSet(Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v4

    throw v4

    .line 1703
    .end local v1    # "e":Ljava/lang/ClassCastException;
    .restart local v3    # "result":Ljava/lang/Double;
    :cond_2
    :try_start_1
    move-object v0, v2

    check-cast v0, Ljava/lang/String;

    move-object v4, v0

    invoke-static {v4}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    .line 1709
    :cond_3
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    return-wide v4

    .line 1704
    :catch_1
    move-exception v1

    .line 1705
    .local v1, "e":Ljava/lang/NumberFormatException;
    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, p1, v2}, Lnanoxml/XMLElement;->invalidValue(Ljava/lang/String;Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v4

    throw v4
.end method

.method public getIntAttribute(Ljava/lang/String;)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1428
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getIntAttribute(Ljava/lang/String;I)I
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 1462
    iget-boolean v2, p0, Lnanoxml/XMLElement;->ignoreCase:Z

    if-eqz v2, :cond_0

    .line 1463
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 1466
    :cond_0
    iget-object v2, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1468
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 1472
    .end local p2    # "defaultValue":I
    :goto_0
    return p2

    .restart local p2    # "defaultValue":I
    :cond_1
    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p2

    goto :goto_0

    .line 1473
    :catch_0
    move-exception v0

    .line 1474
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {p0, p1, v1}, Lnanoxml/XMLElement;->invalidValue(Ljava/lang/String;Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v2

    throw v2
.end method

.method public getIntAttribute(Ljava/lang/String;Ljava/util/Hashtable;Ljava/lang/String;Z)I
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "valueSet"    # Ljava/util/Hashtable;
    .param p3, "defaultKey"    # Ljava/lang/String;
    .param p4, "allowLiteralNumbers"    # Z

    .prologue
    .line 1523
    iget-boolean v4, p0, Lnanoxml/XMLElement;->ignoreCase:Z

    if-eqz v4, :cond_0

    .line 1524
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 1527
    :cond_0
    iget-object v4, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v4, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1530
    .local v2, "key":Ljava/lang/Object;
    if-nez v2, :cond_1

    .line 1531
    move-object v2, p3

    .line 1535
    .end local v2    # "key":Ljava/lang/Object;
    :cond_1
    :try_start_0
    invoke-virtual {p2, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1540
    .local v3, "result":Ljava/lang/Integer;
    if-nez v3, :cond_3

    .line 1541
    if-nez p4, :cond_2

    .line 1542
    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, p1, v2}, Lnanoxml/XMLElement;->invalidValue(Ljava/lang/String;Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v4

    throw v4

    .line 1536
    .end local v3    # "result":Ljava/lang/Integer;
    :catch_0
    move-exception v1

    .line 1537
    .local v1, "e":Ljava/lang/ClassCastException;
    invoke-virtual {p0, p1}, Lnanoxml/XMLElement;->invalidValueSet(Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v4

    throw v4

    .line 1546
    .end local v1    # "e":Ljava/lang/ClassCastException;
    .restart local v3    # "result":Ljava/lang/Integer;
    :cond_2
    :try_start_1
    move-object v0, v2

    check-cast v0, Ljava/lang/String;

    move-object v4, v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    .line 1552
    :cond_3
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    return v4

    .line 1547
    :catch_1
    move-exception v1

    .line 1548
    .local v1, "e":Ljava/lang/NumberFormatException;
    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, p1, v2}, Lnanoxml/XMLElement;->invalidValue(Ljava/lang/String;Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v4

    throw v4
.end method

.method public getIntProperty(Ljava/lang/String;Ljava/util/Hashtable;Ljava/lang/String;)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "valueSet"    # Ljava/util/Hashtable;
    .param p3, "defaultKey"    # Ljava/lang/String;

    .prologue
    .line 1780
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;Ljava/util/Hashtable;Ljava/lang/String;Z)I

    move-result v0

    return v0
.end method

.method public getLineNr()I
    .locals 1

    .prologue
    .line 1119
    iget v0, p0, Lnanoxml/XMLElement;->lineNr:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1884
    iget-object v0, p0, Lnanoxml/XMLElement;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;D)D
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # D

    .prologue
    .line 1820
    invoke-virtual {p0, p1, p2, p3}, Lnanoxml/XMLElement;->getDoubleAttribute(Ljava/lang/String;D)D

    move-result-wide v0

    return-wide v0
.end method

.method public getProperty(Ljava/lang/String;I)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 1810
    invoke-virtual {p0, p1, p2}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getProperty(Ljava/lang/String;Ljava/util/Hashtable;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "valueSet"    # Ljava/util/Hashtable;
    .param p3, "defaultKey"    # Ljava/lang/String;

    .prologue
    .line 1842
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lnanoxml/XMLElement;->getAttribute(Ljava/lang/String;Ljava/util/Hashtable;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1790
    invoke-virtual {p0, p1}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 1800
    invoke-virtual {p0, p1, p2}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "trueValue"    # Ljava/lang/String;
    .param p3, "falseValue"    # Ljava/lang/String;
    .param p4, "defaultValue"    # Z

    .prologue
    .line 1831
    invoke-virtual {p0, p1, p2, p3, p4}, Lnanoxml/XMLElement;->getBooleanAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getSpecialDoubleProperty(Ljava/lang/String;Ljava/util/Hashtable;Ljava/lang/String;)D
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "valueSet"    # Ljava/util/Hashtable;
    .param p3, "defaultKey"    # Ljava/lang/String;

    .prologue
    .line 1875
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lnanoxml/XMLElement;->getDoubleAttribute(Ljava/lang/String;Ljava/util/Hashtable;Ljava/lang/String;Z)D

    move-result-wide v0

    return-wide v0
.end method

.method public getSpecialIntProperty(Ljava/lang/String;Ljava/util/Hashtable;Ljava/lang/String;)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "valueSet"    # Ljava/util/Hashtable;
    .param p3, "defaultKey"    # Ljava/lang/String;

    .prologue
    .line 1864
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;Ljava/util/Hashtable;Ljava/lang/String;Z)I

    move-result v0

    return v0
.end method

.method public getStringAttribute(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1301
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStringAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 1348
    invoke-virtual {p0, p1, p2}, Lnanoxml/XMLElement;->getAttribute(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getStringAttribute(Ljava/lang/String;Ljava/util/Hashtable;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "valueSet"    # Ljava/util/Hashtable;
    .param p3, "defaultKey"    # Ljava/lang/String;
    .param p4, "allowLiterals"    # Z

    .prologue
    .line 1396
    invoke-virtual {p0, p1, p2, p3, p4}, Lnanoxml/XMLElement;->getAttribute(Ljava/lang/String;Ljava/util/Hashtable;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getStringAttributes([Ljava/lang/String;)Ljava/util/Map;
    .locals 4
    .param p1, "names"    # [Ljava/lang/String;

    .prologue
    .line 1306
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1307
    .local v0, "attrNameValue":Ljava/util/Map;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p1

    if-lt v1, v2, :cond_0

    .line 1312
    return-object v0

    .line 1310
    :cond_0
    aget-object v2, p1, v1

    aget-object v3, p1, v1

    invoke-virtual {p0, v3}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1307
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public getStringProperty(Ljava/lang/String;Ljava/util/Hashtable;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "valueSet"    # Ljava/util/Hashtable;
    .param p3, "defaultKey"    # Ljava/lang/String;

    .prologue
    .line 1853
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;Ljava/util/Hashtable;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTagName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1893
    invoke-virtual {p0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected invalidValue(Ljava/lang/String;Ljava/lang/String;)Lnanoxml/XMLParseException;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 3337
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Attribute \""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" does not contain a valid "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "value (\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3338
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Lnanoxml/XMLParseException;

    invoke-virtual {p0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lnanoxml/XMLElement;->parserLineNr:I

    invoke-direct {v1, v2, v3, v0}, Lnanoxml/XMLParseException;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-object v1
.end method

.method protected invalidValueSet(Ljava/lang/String;)Lnanoxml/XMLParseException;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 3313
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid value set (entity name = \""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3314
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Lnanoxml/XMLParseException;

    invoke-virtual {p0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lnanoxml/XMLElement;->parserLineNr:I

    invoke-direct {v1, v2, v3, v0}, Lnanoxml/XMLParseException;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-object v1
.end method

.method public parse(Ljava/io/InputStream;I)V
    .locals 9
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "startingLineNr"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lnanoxml/XMLParseException;
        }
    .end annotation

    .prologue
    .line 2001
    new-instance v4, Ljava/io/BufferedInputStream;

    invoke-direct {v4, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 2002
    .local v4, "in":Ljava/io/BufferedInputStream;
    const/16 v6, 0x64

    .line 2003
    .local v6, "maxHeader":I
    invoke-virtual {v4, v6}, Ljava/io/BufferedInputStream;->mark(I)V

    .line 2004
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 2006
    .local v3, "fistLine":Ljava/lang/StringBuffer;
    :cond_0
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->read()I

    move-result v0

    .local v0, "c":I
    const/4 v8, -0x1

    if-eq v0, v8, :cond_1

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->length()I

    move-result v8

    if-lt v8, v6, :cond_3

    .line 2012
    :cond_1
    :goto_0
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->reset()V

    .line 2013
    const/4 v2, 0x0

    .line 2015
    .local v2, "encoding":Ljava/lang/String;
    const-string v8, "(encoding=\")([\\p{Alnum}-]+)\""

    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v7

    .line 2016
    .local v7, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    .line 2017
    .local v5, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 2018
    const/4 v8, 0x2

    invoke-virtual {v5, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 2022
    :cond_2
    if-nez v2, :cond_4

    .line 2023
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    invoke-direct {v8, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 2028
    .local v1, "dis":Ljava/io/BufferedReader;
    :goto_1
    const/4 v8, 0x1

    :try_start_0
    invoke-virtual {p0, v1, v8}, Lnanoxml/XMLElement;->parseFromReader(Ljava/io/Reader;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2030
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 2031
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->close()V

    .line 2033
    return-void

    .line 2007
    .end local v1    # "dis":Ljava/io/BufferedReader;
    .end local v2    # "encoding":Ljava/lang/String;
    .end local v5    # "matcher":Ljava/util/regex/Matcher;
    .end local v7    # "pattern":Ljava/util/regex/Pattern;
    :cond_3
    int-to-char v8, v0

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 2008
    const/16 v8, 0x3e

    if-ne v0, v8, :cond_0

    goto :goto_0

    .line 2025
    .restart local v2    # "encoding":Ljava/lang/String;
    .restart local v5    # "matcher":Ljava/util/regex/Matcher;
    .restart local v7    # "pattern":Ljava/util/regex/Pattern;
    :cond_4
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    invoke-direct {v8, v4, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v1, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .restart local v1    # "dis":Ljava/io/BufferedReader;
    goto :goto_1

    .line 2029
    :catchall_0
    move-exception v8

    .line 2030
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 2031
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->close()V

    .line 2032
    throw v8
.end method

.method public parseCharArray([CII)V
    .locals 1
    .param p1, "input"    # [C
    .param p2, "offset"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnanoxml/XMLParseException;
        }
    .end annotation

    .prologue
    .line 2244
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lnanoxml/XMLElement;->parseCharArray([CIII)V

    .line 2245
    return-void
.end method

.method public parseCharArray([CIII)V
    .locals 2
    .param p1, "input"    # [C
    .param p2, "offset"    # I
    .param p3, "end"    # I
    .param p4, "startingLineNr"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnanoxml/XMLParseException;
        }
    .end annotation

    .prologue
    .line 2289
    :try_start_0
    new-instance v0, Ljava/io/CharArrayReader;

    invoke-direct {v0, p1, p2, p3}, Ljava/io/CharArrayReader;-><init>([CII)V

    .line 2290
    .local v0, "reader":Ljava/io/Reader;
    invoke-virtual {p0, v0, p4}, Lnanoxml/XMLElement;->parseFromReader(Ljava/io/Reader;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2294
    .end local v0    # "reader":Ljava/io/Reader;
    :goto_0
    return-void

    .line 2291
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public parseFromReader(Ljava/io/Reader;)V
    .locals 1
    .param p1, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lnanoxml/XMLParseException;
        }
    .end annotation

    .prologue
    .line 1932
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lnanoxml/XMLElement;->parseFromReader(Ljava/io/Reader;I)V

    .line 1933
    return-void
.end method

.method public parseFromReader(Ljava/io/Reader;I)V
    .locals 3
    .param p1, "reader"    # Ljava/io/Reader;
    .param p2, "startingLineNr"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lnanoxml/XMLParseException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1973
    iput-char v2, p0, Lnanoxml/XMLElement;->charReadTooMuch:C

    .line 1974
    iput-object p1, p0, Lnanoxml/XMLElement;->reader:Ljava/io/Reader;

    .line 1975
    iput p2, p0, Lnanoxml/XMLElement;->parserLineNr:I

    .line 1978
    :goto_0
    invoke-virtual {p0}, Lnanoxml/XMLElement;->scanWhitespace()C

    move-result v0

    .line 1980
    .local v0, "ch":C
    const/16 v1, 0x3c

    if-eq v0, v1, :cond_0

    .line 1981
    const-string v1, "<"

    invoke-virtual {p0, v1}, Lnanoxml/XMLElement;->expectedInput(Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v1

    throw v1

    .line 1984
    :cond_0
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v0

    .line 1986
    const/16 v1, 0x21

    if-eq v0, v1, :cond_1

    const/16 v1, 0x3f

    if-ne v0, v1, :cond_2

    .line 1987
    :cond_1
    invoke-virtual {p0, v2}, Lnanoxml/XMLElement;->skipSpecialTag(I)V

    goto :goto_0

    .line 1989
    :cond_2
    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->unreadChar(C)V

    .line 1990
    invoke-virtual {p0, p0}, Lnanoxml/XMLElement;->scanElement(Lnanoxml/XMLElement;)V

    .line 1991
    return-void
.end method

.method public parseString(Ljava/lang/String;)V
    .locals 2
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnanoxml/XMLParseException;
        }
    .end annotation

    .prologue
    .line 2068
    :try_start_0
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 2069
    const/4 v1, 0x1

    .line 2068
    invoke-virtual {p0, v0, v1}, Lnanoxml/XMLElement;->parseFromReader(Ljava/io/Reader;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2073
    :goto_0
    return-void

    .line 2070
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public parseString(Ljava/lang/String;I)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnanoxml/XMLParseException;
        }
    .end annotation

    .prologue
    .line 2110
    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->parseString(Ljava/lang/String;)V

    .line 2111
    return-void
.end method

.method public parseString(Ljava/lang/String;II)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnanoxml/XMLParseException;
        }
    .end annotation

    .prologue
    .line 2152
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->parseString(Ljava/lang/String;)V

    .line 2153
    return-void
.end method

.method public parseString(Ljava/lang/String;III)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "end"    # I
    .param p4, "startingLineNr"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lnanoxml/XMLParseException;
        }
    .end annotation

    .prologue
    .line 2196
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 2199
    :try_start_0
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p4}, Lnanoxml/XMLElement;->parseFromReader(Ljava/io/Reader;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2203
    :goto_0
    return-void

    .line 2200
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected readChar()C
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v0, 0xa

    .line 3067
    iget-char v2, p0, Lnanoxml/XMLElement;->charReadTooMuch:C

    if-eqz v2, :cond_0

    .line 3068
    iget-char v0, p0, Lnanoxml/XMLElement;->charReadTooMuch:C

    .line 3069
    .local v0, "ch":C
    const/4 v2, 0x0

    iput-char v2, p0, Lnanoxml/XMLElement;->charReadTooMuch:C

    .line 3080
    .end local v0    # "ch":C
    :goto_0
    return v0

    .line 3072
    :cond_0
    iget-object v2, p0, Lnanoxml/XMLElement;->reader:Ljava/io/Reader;

    invoke-virtual {v2}, Ljava/io/Reader;->read()I

    move-result v1

    .line 3074
    .local v1, "i":I
    if-gez v1, :cond_1

    .line 3075
    invoke-virtual {p0}, Lnanoxml/XMLElement;->unexpectedEndOfData()Lnanoxml/XMLParseException;

    move-result-object v2

    throw v2

    .line 3076
    :cond_1
    if-ne v1, v0, :cond_2

    .line 3077
    iget v2, p0, Lnanoxml/XMLElement;->parserLineNr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lnanoxml/XMLElement;->parserLineNr:I

    goto :goto_0

    .line 3080
    :cond_2
    int-to-char v0, v1

    goto :goto_0
.end method

.method public removeAttribute(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 2406
    iget-boolean v0, p0, Lnanoxml/XMLElement;->ignoreCase:Z

    if-eqz v0, :cond_0

    .line 2407
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 2410
    :cond_0
    iget-object v0, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2411
    return-void
.end method

.method public removeChild(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 2436
    invoke-virtual {p0, p1}, Lnanoxml/XMLElement;->removeAttribute(Ljava/lang/String;)V

    .line 2437
    return-void
.end method

.method public removeChild(Lnanoxml/XMLElement;)V
    .locals 1
    .param p1, "child"    # Lnanoxml/XMLElement;

    .prologue
    .line 2331
    iget-object v0, p0, Lnanoxml/XMLElement;->children:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 2332
    return-void
.end method

.method public removeChildren()V
    .locals 1

    .prologue
    .line 2335
    iget-object v0, p0, Lnanoxml/XMLElement;->children:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    .line 2336
    return-void
.end method

.method public removeProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 2423
    invoke-virtual {p0, p1}, Lnanoxml/XMLElement;->removeAttribute(Ljava/lang/String;)V

    .line 2424
    return-void
.end method

.method protected resolveEntity(Ljava/lang/StringBuffer;)V
    .locals 7
    .param p1, "buf"    # Ljava/lang/StringBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3236
    const/4 v0, 0x0

    .line 3237
    .local v0, "ch":C
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 3240
    .local v3, "keyBuf":Ljava/lang/StringBuffer;
    :goto_0
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v0

    .line 3242
    const/16 v5, 0x3b

    if-ne v0, v5, :cond_0

    .line 3249
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3251
    .local v2, "key":Ljava/lang/String;
    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x23

    if-ne v5, v6, :cond_2

    .line 3253
    const/4 v5, 0x1

    :try_start_0
    invoke-virtual {v2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x78

    if-ne v5, v6, :cond_1

    .line 3254
    const/4 v5, 0x2

    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x10

    invoke-static {v5, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    int-to-char v0, v5

    .line 3262
    :goto_1
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 3272
    :goto_2
    return-void

    .line 3246
    .end local v2    # "key":Ljava/lang/String;
    :cond_0
    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 3256
    .restart local v2    # "key":Ljava/lang/String;
    :cond_1
    const/4 v5, 0x1

    :try_start_1
    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0xa

    invoke-static {v5, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v5

    int-to-char v0, v5

    goto :goto_1

    .line 3258
    :catch_0
    move-exception v1

    .line 3259
    .local v1, "e":Ljava/lang/NumberFormatException;
    invoke-virtual {p0, v2}, Lnanoxml/XMLElement;->unknownEntity(Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v5

    throw v5

    .line 3264
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :cond_2
    iget-object v5, p0, Lnanoxml/XMLElement;->entities:Ljava/util/Hashtable;

    invoke-virtual {v5, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [C

    .line 3266
    .local v4, "value":[C
    if-nez v4, :cond_3

    .line 3267
    invoke-virtual {p0, v2}, Lnanoxml/XMLElement;->unknownEntity(Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v5

    throw v5

    .line 3270
    :cond_3
    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    goto :goto_2
.end method

.method protected scanElement(Lnanoxml/XMLElement;)V
    .locals 11
    .param p1, "elt"    # Lnanoxml/XMLElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x21

    const/16 v9, 0x3e

    const/16 v8, 0x3c

    const/16 v7, 0x2f

    const/4 v6, 0x0

    .line 3103
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 3104
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->scanIdentifier(Ljava/lang/StringBuffer;)V

    .line 3105
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 3106
    .local v4, "name":Ljava/lang/String;
    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->setName(Ljava/lang/String;)V

    .line 3107
    invoke-virtual {p0}, Lnanoxml/XMLElement;->scanWhitespace()C

    move-result v1

    .line 3109
    .local v1, "ch":C
    :goto_0
    if-eq v1, v9, :cond_0

    if-ne v1, v7, :cond_1

    .line 3127
    :cond_0
    if-ne v1, v7, :cond_3

    .line 3128
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v1

    .line 3130
    if-eq v1, v9, :cond_10

    .line 3131
    const-string v5, ">"

    invoke-virtual {p0, v5}, Lnanoxml/XMLElement;->expectedInput(Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v5

    throw v5

    .line 3110
    :cond_1
    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 3111
    invoke-virtual {p0, v1}, Lnanoxml/XMLElement;->unreadChar(C)V

    .line 3112
    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->scanIdentifier(Ljava/lang/StringBuffer;)V

    .line 3113
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 3114
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {p0}, Lnanoxml/XMLElement;->scanWhitespace()C

    move-result v1

    .line 3116
    const/16 v5, 0x3d

    if-eq v1, v5, :cond_2

    .line 3117
    const-string v5, "="

    invoke-virtual {p0, v5}, Lnanoxml/XMLElement;->expectedInput(Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v5

    throw v5

    .line 3120
    :cond_2
    invoke-virtual {p0}, Lnanoxml/XMLElement;->scanWhitespace()C

    move-result v5

    invoke-virtual {p0, v5}, Lnanoxml/XMLElement;->unreadChar(C)V

    .line 3121
    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 3122
    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->scanString(Ljava/lang/StringBuffer;)V

    .line 3123
    invoke-virtual {p1, v3, v0}, Lnanoxml/XMLElement;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 3124
    invoke-virtual {p0}, Lnanoxml/XMLElement;->scanWhitespace()C

    move-result v1

    goto :goto_0

    .line 3137
    .end local v3    # "key":Ljava/lang/String;
    :cond_3
    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 3138
    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->scanWhitespace(Ljava/lang/StringBuffer;)C

    move-result v1

    .line 3140
    if-eq v1, v8, :cond_4

    .line 3141
    invoke-virtual {p0, v1}, Lnanoxml/XMLElement;->unreadChar(C)V

    .line 3142
    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->scanPCData(Ljava/lang/StringBuffer;)V

    .line 3166
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v5

    if-nez v5, :cond_c

    .line 3167
    :goto_2
    if-ne v1, v7, :cond_7

    .line 3191
    invoke-virtual {p0, v1}, Lnanoxml/XMLElement;->unreadChar(C)V

    .line 3200
    :goto_3
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v1

    .line 3202
    if-eq v1, v7, :cond_e

    .line 3203
    const-string v5, "/"

    invoke-virtual {p0, v5}, Lnanoxml/XMLElement;->expectedInput(Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v5

    throw v5

    .line 3145
    :cond_4
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v1

    .line 3147
    if-ne v1, v10, :cond_6

    .line 3148
    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->checkCDATA(Ljava/lang/StringBuffer;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 3149
    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->scanPCData(Ljava/lang/StringBuffer;)V

    goto :goto_1

    .line 3152
    :cond_5
    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->scanWhitespace(Ljava/lang/StringBuffer;)C

    move-result v1

    .line 3153
    if-eq v1, v8, :cond_4

    .line 3154
    invoke-virtual {p0, v1}, Lnanoxml/XMLElement;->unreadChar(C)V

    .line 3155
    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->scanPCData(Ljava/lang/StringBuffer;)V

    goto :goto_1

    .line 3160
    :cond_6
    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_1

    .line 3168
    :cond_7
    if-ne v1, v10, :cond_a

    .line 3169
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v1

    .line 3170
    const/16 v5, 0x2d

    if-eq v1, v5, :cond_8

    .line 3171
    const-string v5, "Comment or Element"

    invoke-virtual {p0, v5}, Lnanoxml/XMLElement;->expectedInput(Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v5

    throw v5

    .line 3173
    :cond_8
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v1

    .line 3174
    const/16 v5, 0x2d

    if-eq v1, v5, :cond_9

    .line 3175
    const-string v5, "Comment or Element"

    invoke-virtual {p0, v5}, Lnanoxml/XMLElement;->expectedInput(Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v5

    throw v5

    .line 3177
    :cond_9
    invoke-virtual {p0}, Lnanoxml/XMLElement;->skipComment()V

    .line 3184
    :goto_4
    invoke-virtual {p0}, Lnanoxml/XMLElement;->scanWhitespace()C

    move-result v1

    .line 3185
    if-eq v1, v8, :cond_b

    .line 3186
    const-string v5, "<"

    invoke-virtual {p0, v5}, Lnanoxml/XMLElement;->expectedInput(Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v5

    throw v5

    .line 3179
    :cond_a
    invoke-virtual {p0, v1}, Lnanoxml/XMLElement;->unreadChar(C)V

    .line 3180
    invoke-virtual {p0}, Lnanoxml/XMLElement;->createAnotherElement()Lnanoxml/XMLElement;

    move-result-object v2

    .line 3181
    .local v2, "child":Lnanoxml/XMLElement;
    invoke-virtual {p0, v2}, Lnanoxml/XMLElement;->scanElement(Lnanoxml/XMLElement;)V

    .line 3182
    invoke-virtual {p1, v2}, Lnanoxml/XMLElement;->addChild(Lnanoxml/XMLElement;)V

    goto :goto_4

    .line 3188
    .end local v2    # "child":Lnanoxml/XMLElement;
    :cond_b
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v1

    goto :goto_2

    .line 3193
    :cond_c
    iget-boolean v5, p0, Lnanoxml/XMLElement;->ignoreWhitespace:Z

    if-eqz v5, :cond_d

    .line 3194
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lnanoxml/XMLElement;->setContent(Ljava/lang/String;)V

    goto :goto_3

    .line 3196
    :cond_d
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lnanoxml/XMLElement;->setContent(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 3206
    :cond_e
    invoke-virtual {p0}, Lnanoxml/XMLElement;->scanWhitespace()C

    move-result v5

    invoke-virtual {p0, v5}, Lnanoxml/XMLElement;->unreadChar(C)V

    .line 3208
    invoke-virtual {p0, v4}, Lnanoxml/XMLElement;->checkLiteral(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_f

    .line 3209
    invoke-virtual {p0, v4}, Lnanoxml/XMLElement;->expectedInput(Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v5

    throw v5

    .line 3212
    :cond_f
    invoke-virtual {p0}, Lnanoxml/XMLElement;->scanWhitespace()C

    move-result v5

    if-eq v5, v9, :cond_10

    .line 3213
    const-string v5, ">"

    invoke-virtual {p0, v5}, Lnanoxml/XMLElement;->expectedInput(Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v5

    throw v5

    .line 3215
    :cond_10
    return-void
.end method

.method protected scanIdentifier(Ljava/lang/StringBuffer;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/StringBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2725
    :goto_0
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v0

    .line 2727
    .local v0, "ch":C
    const/16 v1, 0x41

    if-lt v0, v1, :cond_0

    const/16 v1, 0x5a

    if-le v0, v1, :cond_3

    :cond_0
    const/16 v1, 0x61

    if-lt v0, v1, :cond_1

    const/16 v1, 0x7a

    if-le v0, v1, :cond_3

    :cond_1
    const/16 v1, 0x30

    if-lt v0, v1, :cond_2

    const/16 v1, 0x39

    if-le v0, v1, :cond_3

    :cond_2
    const/16 v1, 0x5f

    if-eq v0, v1, :cond_3

    .line 2728
    const/16 v1, 0x2e

    if-eq v0, v1, :cond_3

    const/16 v1, 0x3a

    if-eq v0, v1, :cond_3

    const/16 v1, 0x2d

    if-eq v0, v1, :cond_3

    const/16 v1, 0x7e

    if-gt v0, v1, :cond_3

    .line 2729
    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->unreadChar(C)V

    .line 2730
    return-void

    .line 2733
    :cond_3
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_0
.end method

.method protected scanPCData(Ljava/lang/StringBuffer;)V
    .locals 2
    .param p1, "data"    # Ljava/lang/StringBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2846
    :goto_0
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v0

    .line 2848
    .local v0, "ch":C
    const/16 v1, 0x3c

    if-ne v0, v1, :cond_1

    .line 2849
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v0

    .line 2851
    const/16 v1, 0x21

    if-ne v0, v1, :cond_0

    .line 2852
    invoke-virtual {p0, p1}, Lnanoxml/XMLElement;->checkCDATA(Ljava/lang/StringBuffer;)Z

    goto :goto_0

    .line 2854
    :cond_0
    invoke-virtual {p0, v0}, Lnanoxml/XMLElement;->unreadChar(C)V

    .line 2855
    return-void

    .line 2857
    :cond_1
    const/16 v1, 0x26

    if-ne v0, v1, :cond_2

    .line 2858
    invoke-virtual {p0, p1}, Lnanoxml/XMLElement;->resolveEntity(Ljava/lang/StringBuffer;)V

    goto :goto_0

    .line 2860
    :cond_2
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_0
.end method

.method protected scanString(Ljava/lang/StringBuffer;)V
    .locals 3
    .param p1, "string"    # Ljava/lang/StringBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2810
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v1

    .line 2812
    .local v1, "delimiter":C
    const/16 v2, 0x27

    if-eq v1, v2, :cond_1

    const/16 v2, 0x22

    if-eq v1, v2, :cond_1

    .line 2813
    const-string v2, "\' or \""

    invoke-virtual {p0, v2}, Lnanoxml/XMLElement;->expectedInput(Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v2

    throw v2

    .line 2821
    .local v0, "ch":C
    :cond_0
    const/16 v2, 0x26

    if-ne v0, v2, :cond_2

    .line 2822
    invoke-virtual {p0, p1}, Lnanoxml/XMLElement;->resolveEntity(Ljava/lang/StringBuffer;)V

    .line 2817
    .end local v0    # "ch":C
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v0

    .line 2819
    .restart local v0    # "ch":C
    if-ne v0, v1, :cond_0

    .line 2820
    return-void

    .line 2824
    :cond_2
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_0
.end method

.method protected scanWhitespace()C
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2744
    :sswitch_0
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v0

    .line 2746
    .local v0, "ch":C
    sparse-switch v0, :sswitch_data_0

    .line 2754
    return v0

    .line 2746
    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0xa -> :sswitch_0
        0xd -> :sswitch_0
        0x20 -> :sswitch_0
    .end sparse-switch
.end method

.method protected scanWhitespace(Ljava/lang/StringBuffer;)C
    .locals 1
    .param p1, "result"    # Ljava/lang/StringBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2777
    :goto_0
    :sswitch_0
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v0

    .line 2779
    .local v0, "ch":C
    sparse-switch v0, :sswitch_data_0

    .line 2789
    return v0

    .line 2783
    :sswitch_1
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 2779
    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_1
        0xa -> :sswitch_1
        0xd -> :sswitch_0
        0x20 -> :sswitch_1
    .end sparse-switch
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 698
    iget-boolean v0, p0, Lnanoxml/XMLElement;->ignoreCase:Z

    if-eqz v0, :cond_0

    .line 699
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 702
    :cond_0
    iget-object v0, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 703
    return-void
.end method

.method public setContent(Ljava/lang/String;)V
    .locals 0
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 2455
    iput-object p1, p0, Lnanoxml/XMLElement;->contents:Ljava/lang/String;

    .line 2456
    return-void
.end method

.method public setDoubleAttribute(Ljava/lang/String;D)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # D

    .prologue
    .line 834
    iget-boolean v0, p0, Lnanoxml/XMLElement;->ignoreCase:Z

    if-eqz v0, :cond_0

    .line 835
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 838
    :cond_0
    iget-object v0, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    invoke-static {p2, p3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 839
    return-void
.end method

.method public setIntAttribute(Ljava/lang/String;I)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 766
    iget-boolean v0, p0, Lnanoxml/XMLElement;->ignoreCase:Z

    if-eqz v0, :cond_0

    .line 767
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    .line 770
    :cond_0
    iget-object v0, p0, Lnanoxml/XMLElement;->attributes:Ljava/util/Hashtable;

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 771
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 2490
    iput-object p1, p0, Lnanoxml/XMLElement;->name:Ljava/lang/String;

    .line 2491
    return-void
.end method

.method public setTagName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 2467
    invoke-virtual {p0, p1}, Lnanoxml/XMLElement;->setName(Ljava/lang/String;)V

    .line 2468
    return-void
.end method

.method protected skipComment()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2949
    const/4 v1, 0x2

    .line 2951
    .local v1, "dashesToRead":I
    :goto_0
    if-gtz v1, :cond_0

    .line 2961
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v2

    const/16 v3, 0x3e

    if-eq v2, v3, :cond_2

    .line 2962
    const-string v2, ">"

    invoke-virtual {p0, v2}, Lnanoxml/XMLElement;->expectedInput(Ljava/lang/String;)Lnanoxml/XMLParseException;

    move-result-object v2

    throw v2

    .line 2952
    :cond_0
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v0

    .line 2954
    .local v0, "ch":C
    const/16 v2, 0x2d

    if-ne v0, v2, :cond_1

    .line 2955
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 2957
    :cond_1
    const/4 v1, 0x2

    goto :goto_0

    .line 2964
    .end local v0    # "ch":C
    :cond_2
    return-void
.end method

.method protected skipSpecialTag(I)V
    .locals 6
    .param p1, "bracketLevel"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x5d

    const/16 v3, 0x2d

    const/16 v4, 0x5b

    .line 2985
    const/4 v2, 0x1

    .line 2986
    .local v2, "tagLevel":I
    const/4 v1, 0x0

    .line 2988
    .local v1, "stringDelimiter":C
    if-nez p1, :cond_0

    .line 2989
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v0

    .line 2991
    .local v0, "ch":C
    if-ne v0, v4, :cond_1

    .line 2992
    add-int/lit8 p1, p1, 0x1

    .line 3007
    .end local v0    # "ch":C
    :cond_0
    :goto_0
    if-gtz v2, :cond_4

    .line 3032
    :goto_1
    return-void

    .line 2993
    .restart local v0    # "ch":C
    :cond_1
    if-ne v0, v3, :cond_0

    .line 2994
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v0

    .line 2996
    if-ne v0, v4, :cond_2

    .line 2997
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 2998
    :cond_2
    if-ne v0, v5, :cond_3

    .line 2999
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    .line 3000
    :cond_3
    if-ne v0, v3, :cond_0

    .line 3001
    invoke-virtual {p0}, Lnanoxml/XMLElement;->skipComment()V

    goto :goto_1

    .line 3008
    .end local v0    # "ch":C
    :cond_4
    invoke-virtual {p0}, Lnanoxml/XMLElement;->readChar()C

    move-result v0

    .line 3010
    .restart local v0    # "ch":C
    if-nez v1, :cond_a

    .line 3011
    const/16 v3, 0x22

    if-eq v0, v3, :cond_5

    const/16 v3, 0x27

    if-ne v0, v3, :cond_7

    .line 3012
    :cond_5
    move v1, v0

    .line 3021
    :cond_6
    :goto_2
    if-ne v0, v4, :cond_9

    .line 3022
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 3013
    :cond_7
    if-gtz p1, :cond_6

    .line 3014
    const/16 v3, 0x3c

    if-ne v0, v3, :cond_8

    .line 3015
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 3016
    :cond_8
    const/16 v3, 0x3e

    if-ne v0, v3, :cond_6

    .line 3017
    add-int/lit8 v2, v2, -0x1

    goto :goto_2

    .line 3023
    :cond_9
    if-ne v0, v5, :cond_0

    .line 3024
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    .line 3027
    :cond_a
    if-ne v0, v1, :cond_0

    .line 3028
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected syntaxError(Ljava/lang/String;)Lnanoxml/XMLParseException;
    .locals 4
    .param p1, "context"    # Ljava/lang/String;

    .prologue
    .line 3368
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Syntax error while parsing "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3369
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Lnanoxml/XMLParseException;

    invoke-virtual {p0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lnanoxml/XMLElement;->parserLineNr:I

    invoke-direct {v1, v2, v3, v0}, Lnanoxml/XMLParseException;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 2500
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 2501
    .local v1, "out":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Ljava/io/OutputStreamWriter;

    invoke-direct {v2, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 2502
    .local v2, "writer":Ljava/io/OutputStreamWriter;
    invoke-virtual {p0, v2}, Lnanoxml/XMLElement;->write(Ljava/io/Writer;)V

    .line 2503
    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->flush()V

    .line 2504
    new-instance v3, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2507
    .end local v1    # "out":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "writer":Ljava/io/OutputStreamWriter;
    :goto_0
    return-object v3

    .line 2505
    :catch_0
    move-exception v0

    .line 2507
    .local v0, "e":Ljava/io/IOException;
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method protected unexpectedEndOfData()Lnanoxml/XMLParseException;
    .locals 4

    .prologue
    .line 3346
    const-string v0, "Unexpected end of data reached"

    .line 3347
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Lnanoxml/XMLParseException;

    invoke-virtual {p0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lnanoxml/XMLElement;->parserLineNr:I

    invoke-direct {v1, v2, v3, v0}, Lnanoxml/XMLParseException;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-object v1
.end method

.method protected unknownEntity(Ljava/lang/String;)Lnanoxml/XMLParseException;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 3414
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown or invalid entity: &"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3415
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Lnanoxml/XMLParseException;

    invoke-virtual {p0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lnanoxml/XMLElement;->parserLineNr:I

    invoke-direct {v1, v2, v3, v0}, Lnanoxml/XMLParseException;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-object v1
.end method

.method protected unreadChar(C)V
    .locals 0
    .param p1, "ch"    # C

    .prologue
    .line 3292
    iput-char p1, p0, Lnanoxml/XMLElement;->charReadTooMuch:C

    .line 3293
    return-void
.end method

.method public write(Ljava/io/Writer;)V
    .locals 1
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2534
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnanoxml/XMLElement;->writeIdented(Ljava/io/Writer;I)V

    .line 2535
    return-void
.end method

.method protected writeEncoded(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 9
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x6f

    const/16 v7, 0x61

    const/16 v6, 0x74

    const/16 v5, 0x3b

    const/16 v4, 0x26

    .line 2633
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v1, v3, :cond_0

    .line 2691
    return-void

    .line 2634
    :cond_0
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 2636
    .local v0, "ch":C
    sparse-switch v0, :sswitch_data_0

    .line 2678
    move v2, v0

    .line 2680
    .local v2, "unicode":I
    const/16 v3, 0x20

    if-lt v2, v3, :cond_1

    const/16 v3, 0x7e

    if-le v2, v3, :cond_2

    .line 2681
    :cond_1
    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(I)V

    .line 2682
    const/16 v3, 0x23

    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(I)V

    .line 2683
    const/16 v3, 0x78

    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(I)V

    .line 2684
    const/16 v3, 0x10

    invoke-static {v2, v3}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 2685
    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V

    .line 2633
    .end local v2    # "unicode":I
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2638
    :sswitch_0
    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(I)V

    .line 2639
    const/16 v3, 0x6c

    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(I)V

    .line 2640
    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(I)V

    .line 2641
    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V

    goto :goto_1

    .line 2645
    :sswitch_1
    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(I)V

    .line 2646
    const/16 v3, 0x67

    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(I)V

    .line 2647
    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(I)V

    .line 2648
    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V

    goto :goto_1

    .line 2652
    :sswitch_2
    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(I)V

    .line 2653
    invoke-virtual {p1, v7}, Ljava/io/Writer;->write(I)V

    .line 2654
    const/16 v3, 0x6d

    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(I)V

    .line 2655
    const/16 v3, 0x70

    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(I)V

    .line 2656
    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V

    goto :goto_1

    .line 2660
    :sswitch_3
    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(I)V

    .line 2661
    const/16 v3, 0x71

    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(I)V

    .line 2662
    const/16 v3, 0x75

    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(I)V

    .line 2663
    invoke-virtual {p1, v8}, Ljava/io/Writer;->write(I)V

    .line 2664
    invoke-virtual {p1, v6}, Ljava/io/Writer;->write(I)V

    .line 2665
    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V

    goto :goto_1

    .line 2669
    :sswitch_4
    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(I)V

    .line 2670
    invoke-virtual {p1, v7}, Ljava/io/Writer;->write(I)V

    .line 2671
    const/16 v3, 0x70

    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(I)V

    .line 2672
    invoke-virtual {p1, v8}, Ljava/io/Writer;->write(I)V

    .line 2673
    const/16 v3, 0x73

    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(I)V

    .line 2674
    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V

    goto :goto_1

    .line 2687
    .restart local v2    # "unicode":I
    :cond_2
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V

    goto :goto_1

    .line 2636
    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_3
        0x26 -> :sswitch_2
        0x27 -> :sswitch_4
        0x3c -> :sswitch_0
        0x3e -> :sswitch_1
    .end sparse-switch
.end method
