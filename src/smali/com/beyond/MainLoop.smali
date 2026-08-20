.class Lcom/beyond/MainLoop;
.super Ljava/lang/Thread;
.source "JletActivity.java"


# instance fields
.field main_class:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "main_class0"    # Ljava/lang/String;

    .prologue
    .line 490
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 492
    iput-object p1, p0, Lcom/beyond/MainLoop;->main_class:Ljava/lang/String;

    .line 493
    sget-boolean v0, Lcom/beyond/JletActivity;->CONFIG_BUILD_SDK:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/beyond/BeyondBridge;->carrier_socket:Lorg/kwis/msf/io/Socket;

    if-nez v0, :cond_0

    .line 494
    const-string v0, "Launcher"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 496
    :cond_0
    return-void
.end method


# virtual methods
.method public drawJavaBeyondLogo()V
    .locals 1

    .prologue
    .line 585
    sget-object v0, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    invoke-virtual {v0}, Lcom/beyond/JletView;->postInvalidate()V

    .line 586
    const/4 v0, 0x2

    sput v0, Lcom/beyond/JletActivity;->logoState:I

    .line 587
    return-void
.end method

.method public drawJavaRightLogoI(I)V
    .locals 1
    .param p1, "restDays"    # I

    .prologue
    .line 579
    sput p1, Lcom/beyond/JletActivity;->restDays:I

    .line 580
    sget-object v0, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    invoke-virtual {v0}, Lcom/beyond/JletView;->postInvalidate()V

    .line 581
    const/4 v0, 0x1

    sput v0, Lcom/beyond/JletActivity;->logoState:I

    .line 582
    return-void
.end method

.method public native pltStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public run()V
    .locals 11

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 499
    const/4 v5, -0x1

    .line 501
    .local v5, "ready":I
    :cond_0
    :goto_0
    if-lez v5, :cond_5

    .line 515
    sget-object v6, Lcom/beyond/BeyondBridge;->carrier_socket:Lorg/kwis/msf/io/Socket;

    if-nez v6, :cond_2

    .line 516
    sget-boolean v6, Lcom/beyond/JletActivity;->CONFIG_BUILD_SDK:Z

    if-eqz v6, :cond_1

    .line 517
    sget-object v6, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/beyond/MainLoop;->main_class:Ljava/lang/String;

    invoke-virtual {p0, v6, v7, v8}, Lcom/beyond/MainLoop;->pltStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 519
    :cond_1
    const-string v6, "skip_blog"

    invoke-static {v6}, Lcom/beyond/AppProperty;->getInt(Ljava/lang/String;)I

    move-result v6

    if-eq v6, v10, :cond_2

    .line 520
    invoke-virtual {p0}, Lcom/beyond/MainLoop;->drawJavaBeyondLogo()V

    .line 522
    const-wide/16 v6, 0x3e8

    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    .line 525
    :goto_1
    sput v9, Lcom/beyond/JletActivity;->logoState:I

    .line 531
    :cond_2
    :try_start_1
    iget-object v6, p0, Lcom/beyond/MainLoop;->main_class:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/beyond/JletBridge;

    sput-object v6, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 537
    sget-object v6, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    if-nez v6, :cond_3

    .line 538
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "cannot create new instance of "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/beyond/MainLoop;->main_class:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 539
    invoke-static {v9}, Ljava/lang/System;->exit(I)V

    .line 541
    :cond_3
    sput-boolean v10, Lcom/beyond/JletActivity;->isAppCreaed:Z

    .line 544
    const/4 v6, 0x4

    new-array v3, v6, [I

    .line 545
    .local v3, "event":[I
    const/4 v4, 0x0

    .line 547
    .local v4, "pid":I
    if-ltz v4, :cond_4

    .line 548
    const/16 v6, 0x65

    aput v6, v3, v9

    .line 549
    aput v9, v3, v10

    .line 550
    const/4 v6, 0x2

    aput v9, v3, v6

    .line 552
    sget-object v6, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    invoke-virtual {v6, v3}, Lcom/beyond/JletBridge;->postEvent([I)Z

    .line 556
    :cond_4
    new-array v0, v10, [Ljava/lang/String;

    iget-object v6, p0, Lcom/beyond/MainLoop;->main_class:Ljava/lang/String;

    aput-object v6, v0, v9

    .line 557
    .local v0, "args":[Ljava/lang/String;
    sget-object v6, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    invoke-virtual {v6, v0}, Lcom/beyond/JletBridge;->startApp([Ljava/lang/String;)V

    .line 560
    sget-object v6, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    iget-object v2, v6, Lcom/beyond/JletBridge;->eq0:Lcom/beyond/EventQueueBridge;

    .line 562
    .local v2, "eq":Lcom/beyond/EventQueueBridge;
    :goto_2
    sget-object v6, Lcom/beyond/JletActivity;->app:Lcom/beyond/JletBridge;

    iget v6, v6, Lcom/beyond/JletBridge;->state:I

    if-nez v6, :cond_6

    .line 573
    invoke-static {v9}, Ljava/lang/System;->exit(I)V

    .line 574
    .end local v0    # "args":[Ljava/lang/String;
    .end local v2    # "eq":Lcom/beyond/EventQueueBridge;
    .end local v3    # "event":[I
    .end local v4    # "pid":I
    :goto_3
    return-void

    .line 503
    :cond_5
    :try_start_2
    sget-object v6, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    invoke-virtual {v6}, Lcom/beyond/JletView;->getWidth()I

    move-result v5

    .line 504
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "ready = "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 508
    :goto_4
    if-gtz v5, :cond_0

    .line 510
    const-wide/16 v6, 0x64

    :try_start_3
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_0

    .line 511
    :catch_0
    move-exception v6

    goto/16 :goto_0

    .line 505
    :catch_1
    move-exception v1

    .line 506
    .local v1, "e":Ljava/lang/Exception;
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "not ready !!!"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_4

    .line 532
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v1

    .line 533
    .restart local v1    # "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 534
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "cannot instantiate class "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/beyond/MainLoop;->main_class:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_3

    .line 564
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "args":[Ljava/lang/String;
    .restart local v2    # "eq":Lcom/beyond/EventQueueBridge;
    .restart local v3    # "event":[I
    .restart local v4    # "pid":I
    :cond_6
    :try_start_4
    invoke-virtual {v2, v3}, Lcom/beyond/EventQueueBridge;->getNextEvent([I)V

    .line 565
    invoke-virtual {v2, v3}, Lcom/beyond/EventQueueBridge;->dispatchEvent([I)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_2

    .line 567
    :catch_3
    move-exception v1

    .line 568
    .local v1, "e":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 569
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "exception occured when dispatch event : "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2

    .line 523
    .end local v0    # "args":[Ljava/lang/String;
    .end local v1    # "e":Ljava/lang/Throwable;
    .end local v2    # "eq":Lcom/beyond/EventQueueBridge;
    .end local v3    # "event":[I
    .end local v4    # "pid":I
    :catch_4
    move-exception v6

    goto/16 :goto_1
.end method
