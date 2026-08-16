	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807A3AC
sub_0807A3AC: @ 0x0807A3AC
	adds r2, r0, #0
	ldr r0, _0807A3CC @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #1
	beq _0807A3B8
	b _0807A84C
_0807A3B8:
	subs r0, r1, #1
	cmp r0, #0x29
	bls _0807A3C0
	b _0807A84C
_0807A3C0:
	lsls r0, r0, #2
	ldr r1, _0807A3D0 @ =_0807A3D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807A3CC: .4byte gUnknown_03003FC0
_0807A3D0: .4byte _0807A3D4
_0807A3D4: @ jump table
	.4byte _0807A47C @ case 0
	.4byte _0807A480 @ case 1
	.4byte _0807A484 @ case 2
	.4byte _0807A488 @ case 3
	.4byte _0807A490 @ case 4
	.4byte _0807A496 @ case 5
	.4byte _0807A4A0 @ case 6
	.4byte _0807A4A8 @ case 7
	.4byte _0807A4D2 @ case 8
	.4byte _0807A4D8 @ case 9
	.4byte _0807A4E0 @ case 10
	.4byte _0807A4E8 @ case 11
	.4byte _0807A4EE @ case 12
	.4byte _0807A4F8 @ case 13
	.4byte _0807A500 @ case 14
	.4byte _0807A52C @ case 15
	.4byte _0807A558 @ case 16
	.4byte _0807A560 @ case 17
	.4byte _0807A568 @ case 18
	.4byte _0807A570 @ case 19
	.4byte _0807A578 @ case 20
	.4byte _0807A580 @ case 21
	.4byte _0807A588 @ case 22
	.4byte _0807A5B4 @ case 23
	.4byte _0807A5E0 @ case 24
	.4byte _0807A5E8 @ case 25
	.4byte _0807A5F0 @ case 26
	.4byte _0807A5F8 @ case 27
	.4byte _0807A600 @ case 28
	.4byte _0807A608 @ case 29
	.4byte _0807A610 @ case 30
	.4byte _0807A63C @ case 31
	.4byte _0807A668 @ case 32
	.4byte _0807A728 @ case 33
	.4byte _0807A7E6 @ case 34
	.4byte _0807A7F0 @ case 35
	.4byte _0807A7F8 @ case 36
	.4byte _0807A800 @ case 37
	.4byte _0807A808 @ case 38
	.4byte _0807A810 @ case 39
	.4byte _0807A818 @ case 40
	.4byte _0807A820 @ case 41
_0807A47C:
	movs r0, #0x7c
	b _0807A858
_0807A480:
	movs r0, #0xb1
	b _0807A858
_0807A484:
	movs r0, #0xf4
	b _0807A858
_0807A488:
	ldr r0, _0807A48C @ =0x0000013F
	b _0807A858
	.align 2, 0
_0807A48C: .4byte 0x0000013F
_0807A490:
	movs r0, #0xc1
	lsls r0, r0, #1
	b _0807A858
_0807A496:
	ldr r0, _0807A49C @ =0x000001D5
	b _0807A858
	.align 2, 0
_0807A49C: .4byte 0x000001D5
_0807A4A0:
	ldr r0, _0807A4A4 @ =0x00000207
	b _0807A858
	.align 2, 0
_0807A4A4: .4byte 0x00000207
_0807A4A8:
	cmp r2, #2
	beq _0807A4CC
	cmp r2, #2
	bgt _0807A4B6
	cmp r2, #1
	beq _0807A4BC
	b _0807A84C
_0807A4B6:
	cmp r2, #4
	beq _0807A4C4
	b _0807A84C
_0807A4BC:
	ldr r0, _0807A4C0 @ =0x0000023A
	b _0807A858
	.align 2, 0
_0807A4C0: .4byte 0x0000023A
_0807A4C4:
	ldr r0, _0807A4C8 @ =0x0000023B
	b _0807A858
	.align 2, 0
_0807A4C8: .4byte 0x0000023B
_0807A4CC:
	movs r0, #0x8f
	lsls r0, r0, #2
	b _0807A858
_0807A4D2:
	movs r0, #0xea
	lsls r0, r0, #2
	b _0807A858
_0807A4D8:
	ldr r0, _0807A4DC @ =0x000003DA
	b _0807A858
	.align 2, 0
_0807A4DC: .4byte 0x000003DA
_0807A4E0:
	ldr r0, _0807A4E4 @ =0x00000404
	b _0807A858
	.align 2, 0
_0807A4E4: .4byte 0x00000404
_0807A4E8:
	movs r0, #0x86
	lsls r0, r0, #3
	b _0807A858
_0807A4EE:
	ldr r0, _0807A4F4 @ =0x0000044E
	b _0807A858
	.align 2, 0
_0807A4F4: .4byte 0x0000044E
_0807A4F8:
	ldr r0, _0807A4FC @ =0x0000046C
	b _0807A858
	.align 2, 0
_0807A4FC: .4byte 0x0000046C
_0807A500:
	cmp r2, #5
	beq _0807A51C
	cmp r2, #5
	bgt _0807A50E
	cmp r2, #3
	beq _0807A514
	b _0807A84C
_0807A50E:
	cmp r2, #0x10
	beq _0807A524
	b _0807A84C
_0807A514:
	ldr r0, _0807A518 @ =0x00000481
	b _0807A858
	.align 2, 0
_0807A518: .4byte 0x00000481
_0807A51C:
	ldr r0, _0807A520 @ =0x00000482
	b _0807A858
	.align 2, 0
_0807A520: .4byte 0x00000482
_0807A524:
	ldr r0, _0807A528 @ =0x00000483
	b _0807A858
	.align 2, 0
_0807A528: .4byte 0x00000483
_0807A52C:
	cmp r2, #5
	beq _0807A546
	cmp r2, #5
	bgt _0807A53A
	cmp r2, #3
	beq _0807A540
	b _0807A84C
_0807A53A:
	cmp r2, #0x10
	beq _0807A550
	b _0807A84C
_0807A540:
	movs r0, #0x99
	lsls r0, r0, #3
	b _0807A858
_0807A546:
	ldr r0, _0807A54C @ =0x000004C9
	b _0807A858
	.align 2, 0
_0807A54C: .4byte 0x000004C9
_0807A550:
	ldr r0, _0807A554 @ =0x000004CA
	b _0807A858
	.align 2, 0
_0807A554: .4byte 0x000004CA
_0807A558:
	ldr r0, _0807A55C @ =0x00000685
	b _0807A858
	.align 2, 0
_0807A55C: .4byte 0x00000685
_0807A560:
	ldr r0, _0807A564 @ =0x000006B5
	b _0807A858
	.align 2, 0
_0807A564: .4byte 0x000006B5
_0807A568:
	ldr r0, _0807A56C @ =0x000006D5
	b _0807A858
	.align 2, 0
_0807A56C: .4byte 0x000006D5
_0807A570:
	ldr r0, _0807A574 @ =0x0000070A
	b _0807A858
	.align 2, 0
_0807A574: .4byte 0x0000070A
_0807A578:
	ldr r0, _0807A57C @ =0x0000072D
	b _0807A858
	.align 2, 0
_0807A57C: .4byte 0x0000072D
_0807A580:
	ldr r0, _0807A584 @ =0x00000755
	b _0807A858
	.align 2, 0
_0807A584: .4byte 0x00000755
_0807A588:
	cmp r2, #7
	beq _0807A5A4
	cmp r2, #7
	bgt _0807A596
	cmp r2, #6
	beq _0807A59C
	b _0807A84C
_0807A596:
	cmp r2, #0x12
	beq _0807A5AC
	b _0807A84C
_0807A59C:
	ldr r0, _0807A5A0 @ =0x00000772
	b _0807A858
	.align 2, 0
_0807A5A0: .4byte 0x00000772
_0807A5A4:
	ldr r0, _0807A5A8 @ =0x00000773
	b _0807A858
	.align 2, 0
_0807A5A8: .4byte 0x00000773
_0807A5AC:
	ldr r0, _0807A5B0 @ =0x00000774
	b _0807A858
	.align 2, 0
_0807A5B0: .4byte 0x00000774
_0807A5B4:
	cmp r2, #7
	beq _0807A5D0
	cmp r2, #7
	bgt _0807A5C2
	cmp r2, #6
	beq _0807A5C8
	b _0807A84C
_0807A5C2:
	cmp r2, #0x12
	beq _0807A5D8
	b _0807A84C
_0807A5C8:
	ldr r0, _0807A5CC @ =0x000007B1
	b _0807A858
	.align 2, 0
_0807A5CC: .4byte 0x000007B1
_0807A5D0:
	ldr r0, _0807A5D4 @ =0x000007B2
	b _0807A858
	.align 2, 0
_0807A5D4: .4byte 0x000007B2
_0807A5D8:
	ldr r0, _0807A5DC @ =0x000007B3
	b _0807A858
	.align 2, 0
_0807A5DC: .4byte 0x000007B3
_0807A5E0:
	ldr r0, _0807A5E4 @ =0x00000504
	b _0807A858
	.align 2, 0
_0807A5E4: .4byte 0x00000504
_0807A5E8:
	ldr r0, _0807A5EC @ =0x0000052F
	b _0807A858
	.align 2, 0
_0807A5EC: .4byte 0x0000052F
_0807A5F0:
	ldr r0, _0807A5F4 @ =0x0000056A
	b _0807A858
	.align 2, 0
_0807A5F4: .4byte 0x0000056A
_0807A5F8:
	ldr r0, _0807A5FC @ =0x0000059A
	b _0807A858
	.align 2, 0
_0807A5FC: .4byte 0x0000059A
_0807A600:
	ldr r0, _0807A604 @ =0x000005BB
	b _0807A858
	.align 2, 0
_0807A604: .4byte 0x000005BB
_0807A608:
	ldr r0, _0807A60C @ =0x000005EF
	b _0807A858
	.align 2, 0
_0807A60C: .4byte 0x000005EF
_0807A610:
	cmp r2, #9
	beq _0807A62C
	cmp r2, #9
	bgt _0807A61E
	cmp r2, #8
	beq _0807A624
	b _0807A84C
_0807A61E:
	cmp r2, #0x11
	beq _0807A634
	b _0807A84C
_0807A624:
	ldr r0, _0807A628 @ =0x00000614
	b _0807A858
	.align 2, 0
_0807A628: .4byte 0x00000614
_0807A62C:
	ldr r0, _0807A630 @ =0x00000615
	b _0807A858
	.align 2, 0
_0807A630: .4byte 0x00000615
_0807A634:
	ldr r0, _0807A638 @ =0x00000616
	b _0807A858
	.align 2, 0
_0807A638: .4byte 0x00000616
_0807A63C:
	cmp r2, #9
	beq _0807A658
	cmp r2, #9
	bgt _0807A64A
	cmp r2, #8
	beq _0807A650
	b _0807A84C
_0807A64A:
	cmp r2, #0x11
	beq _0807A660
	b _0807A84C
_0807A650:
	ldr r0, _0807A654 @ =0x00000654
	b _0807A858
	.align 2, 0
_0807A654: .4byte 0x00000654
_0807A658:
	ldr r0, _0807A65C @ =0x00000655
	b _0807A858
	.align 2, 0
_0807A65C: .4byte 0x00000655
_0807A660:
	ldr r0, _0807A664 @ =0x00000656
	b _0807A858
	.align 2, 0
_0807A664: .4byte 0x00000656
_0807A668:
	subs r0, r2, #1
	cmp r0, #0x11
	bls _0807A670
	b _0807A84C
_0807A670:
	lsls r0, r0, #2
	ldr r1, _0807A67C @ =_0807A680
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807A67C: .4byte _0807A680
_0807A680: @ jump table
	.4byte _0807A6C8 @ case 0
	.4byte _0807A6D8 @ case 1
	.4byte _0807A6E0 @ case 2
	.4byte _0807A6D0 @ case 3
	.4byte _0807A6E8 @ case 4
	.4byte _0807A6F8 @ case 5
	.4byte _0807A700 @ case 6
	.4byte _0807A710 @ case 7
	.4byte _0807A718 @ case 8
	.4byte _0807A84C @ case 9
	.4byte _0807A84C @ case 10
	.4byte _0807A84C @ case 11
	.4byte _0807A84C @ case 12
	.4byte _0807A84C @ case 13
	.4byte _0807A84C @ case 14
	.4byte _0807A6F0 @ case 15
	.4byte _0807A720 @ case 16
	.4byte _0807A706 @ case 17
_0807A6C8:
	ldr r0, _0807A6CC @ =0x000007F1
	b _0807A858
	.align 2, 0
_0807A6CC: .4byte 0x000007F1
_0807A6D0:
	ldr r0, _0807A6D4 @ =0x000007F3
	b _0807A858
	.align 2, 0
_0807A6D4: .4byte 0x000007F3
_0807A6D8:
	ldr r0, _0807A6DC @ =0x000007F2
	b _0807A858
	.align 2, 0
_0807A6DC: .4byte 0x000007F2
_0807A6E0:
	ldr r0, _0807A6E4 @ =0x000007F4
	b _0807A858
	.align 2, 0
_0807A6E4: .4byte 0x000007F4
_0807A6E8:
	ldr r0, _0807A6EC @ =0x000007F5
	b _0807A858
	.align 2, 0
_0807A6EC: .4byte 0x000007F5
_0807A6F0:
	ldr r0, _0807A6F4 @ =0x000007F6
	b _0807A858
	.align 2, 0
_0807A6F4: .4byte 0x000007F6
_0807A6F8:
	ldr r0, _0807A6FC @ =0x000007F7
	b _0807A858
	.align 2, 0
_0807A6FC: .4byte 0x000007F7
_0807A700:
	movs r0, #0xff
	lsls r0, r0, #3
	b _0807A858
_0807A706:
	ldr r0, _0807A70C @ =0x000007F9
	b _0807A858
	.align 2, 0
_0807A70C: .4byte 0x000007F9
_0807A710:
	ldr r0, _0807A714 @ =0x000007FA
	b _0807A858
	.align 2, 0
_0807A714: .4byte 0x000007FA
_0807A718:
	ldr r0, _0807A71C @ =0x000007FB
	b _0807A858
	.align 2, 0
_0807A71C: .4byte 0x000007FB
_0807A720:
	ldr r0, _0807A724 @ =0x000007FC
	b _0807A858
	.align 2, 0
_0807A724: .4byte 0x000007FC
_0807A728:
	subs r0, r2, #1
	cmp r0, #0x11
	bls _0807A730
	b _0807A84C
_0807A730:
	lsls r0, r0, #2
	ldr r1, _0807A73C @ =_0807A740
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807A73C: .4byte _0807A740
_0807A740: @ jump table
	.4byte _0807A788 @ case 0
	.4byte _0807A798 @ case 1
	.4byte _0807A7A0 @ case 2
	.4byte _0807A790 @ case 3
	.4byte _0807A7A8 @ case 4
	.4byte _0807A7B8 @ case 5
	.4byte _0807A7C0 @ case 6
	.4byte _0807A7D0 @ case 7
	.4byte _0807A7D8 @ case 8
	.4byte _0807A84C @ case 9
	.4byte _0807A84C @ case 10
	.4byte _0807A84C @ case 11
	.4byte _0807A84C @ case 12
	.4byte _0807A84C @ case 13
	.4byte _0807A84C @ case 14
	.4byte _0807A7B0 @ case 15
	.4byte _0807A7E0 @ case 16
	.4byte _0807A7C8 @ case 17
_0807A788:
	ldr r0, _0807A78C @ =0x00000895
	b _0807A858
	.align 2, 0
_0807A78C: .4byte 0x00000895
_0807A790:
	ldr r0, _0807A794 @ =0x00000897
	b _0807A858
	.align 2, 0
_0807A794: .4byte 0x00000897
_0807A798:
	ldr r0, _0807A79C @ =0x00000896
	b _0807A858
	.align 2, 0
_0807A79C: .4byte 0x00000896
_0807A7A0:
	ldr r0, _0807A7A4 @ =0x00000898
	b _0807A858
	.align 2, 0
_0807A7A4: .4byte 0x00000898
_0807A7A8:
	ldr r0, _0807A7AC @ =0x00000899
	b _0807A858
	.align 2, 0
_0807A7AC: .4byte 0x00000899
_0807A7B0:
	ldr r0, _0807A7B4 @ =0x0000089A
	b _0807A858
	.align 2, 0
_0807A7B4: .4byte 0x0000089A
_0807A7B8:
	ldr r0, _0807A7BC @ =0x0000089B
	b _0807A858
	.align 2, 0
_0807A7BC: .4byte 0x0000089B
_0807A7C0:
	ldr r0, _0807A7C4 @ =0x0000089D
	b _0807A858
	.align 2, 0
_0807A7C4: .4byte 0x0000089D
_0807A7C8:
	ldr r0, _0807A7CC @ =0x0000089C
	b _0807A858
	.align 2, 0
_0807A7CC: .4byte 0x0000089C
_0807A7D0:
	ldr r0, _0807A7D4 @ =0x0000089E
	b _0807A858
	.align 2, 0
_0807A7D4: .4byte 0x0000089E
_0807A7D8:
	ldr r0, _0807A7DC @ =0x0000089F
	b _0807A858
	.align 2, 0
_0807A7DC: .4byte 0x0000089F
_0807A7E0:
	movs r0, #0x8a
	lsls r0, r0, #4
	b _0807A858
_0807A7E6:
	ldr r0, _0807A7EC @ =0x00000263
	b _0807A858
	.align 2, 0
_0807A7EC: .4byte 0x00000263
_0807A7F0:
	ldr r0, _0807A7F4 @ =0x0000027E
	b _0807A858
	.align 2, 0
_0807A7F4: .4byte 0x0000027E
_0807A7F8:
	ldr r0, _0807A7FC @ =0x000002AF
	b _0807A858
	.align 2, 0
_0807A7FC: .4byte 0x000002AF
_0807A800:
	ldr r0, _0807A804 @ =0x000002C9
	b _0807A858
	.align 2, 0
_0807A804: .4byte 0x000002C9
_0807A808:
	ldr r0, _0807A80C @ =0x000002F9
	b _0807A858
	.align 2, 0
_0807A80C: .4byte 0x000002F9
_0807A810:
	ldr r0, _0807A814 @ =0x00000321
	b _0807A858
	.align 2, 0
_0807A814: .4byte 0x00000321
_0807A818:
	ldr r0, _0807A81C @ =0x0000033F
	b _0807A858
	.align 2, 0
_0807A81C: .4byte 0x0000033F
_0807A820:
	cmp r2, #2
	beq _0807A844
	cmp r2, #2
	bgt _0807A82E
	cmp r2, #1
	beq _0807A834
	b _0807A84C
_0807A82E:
	cmp r2, #4
	beq _0807A83C
	b _0807A84C
_0807A834:
	ldr r0, _0807A838 @ =0x00000369
	b _0807A858
	.align 2, 0
_0807A838: .4byte 0x00000369
_0807A83C:
	ldr r0, _0807A840 @ =0x0000036A
	b _0807A858
	.align 2, 0
_0807A840: .4byte 0x0000036A
_0807A844:
	ldr r0, _0807A848 @ =0x0000036B
	b _0807A858
	.align 2, 0
_0807A848: .4byte 0x0000036B
_0807A84C:
	ldr r0, _0807A85C @ =gUnknown_085D3DD0
	lsls r1, r2, #6
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r0, [r1, #0x34]
_0807A858:
	bx lr
	.align 2, 0
_0807A85C: .4byte gUnknown_085D3DD0

