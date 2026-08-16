	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800F564
sub_0800F564: @ 0x0800F564
	push {r4, r5, r6, r7, lr}
	adds r6, r2, #0
	ldr r2, _0800F650 @ =gUnknown_08499590
	ldr r4, [r2]
	ldr r2, _0800F654 @ =gUnknown_08488954
	lsls r3, r6, #1
	adds r2, r3, r2
	movs r5, #0
	ldrsh r2, [r2, r5]
	adds r5, r1, r2
	lsls r2, r5, #1
	ldr r7, _0800F658 @ =0x0000417A
	adds r1, r4, r7
	adds r1, r1, r2
	ldrh r2, [r1]
	ldr r1, _0800F65C @ =gUnknown_0848894C
	adds r3, r3, r1
	movs r7, #0
	ldrsh r1, [r3, r7]
	adds r3, r0, r1
	adds r2, r2, r3
	lsls r2, r2, #1
	ldr r1, _0800F660 @ =0x00000A22
	adds r0, r4, r1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r7, #0
	cmp r3, #0
	bge _0800F5A0
	b _0800F76A
_0800F5A0:
	ldrh r2, [r4]
	cmp r3, r2
	blt _0800F5A8
	b _0800F76A
_0800F5A8:
	cmp r5, #0
	bge _0800F5AE
	b _0800F76A
_0800F5AE:
	ldrh r4, [r4, #2]
	cmp r5, r4
	blt _0800F5B6
	b _0800F76A
_0800F5B6:
	ldr r4, _0800F664 @ =0xFFFFFEBE
	adds r0, r1, r4
	cmp r0, #1
	bls _0800F60A
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	beq _0800F60A
	adds r0, #1
	cmp r1, r0
	beq _0800F60A
	adds r0, #0x1f
	cmp r1, r0
	beq _0800F60A
	adds r0, #1
	cmp r1, r0
	beq _0800F60A
	adds r0, #1
	cmp r1, r0
	beq _0800F60A
	adds r0, #1
	cmp r1, r0
	beq _0800F60A
	subs r0, #0x41
	cmp r1, r0
	beq _0800F60A
	adds r0, #1
	cmp r1, r0
	beq _0800F60A
	subs r0, #2
	cmp r1, r0
	beq _0800F60A
	subs r0, #1
	cmp r1, r0
	beq _0800F60A
	subs r0, #0x1d
	cmp r1, r0
	beq _0800F60A
	subs r0, #1
	cmp r1, r0
	beq _0800F60A
	b _0800F76A
_0800F60A:
	movs r7, #1
	cmp r6, #0
	bne _0800F66C
	movs r0, #0xa1
	lsls r0, r0, #1
	cmp r1, r0
	bne _0800F61A
	b _0800F740
_0800F61A:
	subs r0, #2
	cmp r1, r0
	bne _0800F622
	b _0800F740
_0800F622:
	adds r0, #0x20
	cmp r1, r0
	bne _0800F62A
	b _0800F740
_0800F62A:
	adds r0, #2
	cmp r1, r0
	bne _0800F632
	b _0800F740
_0800F632:
	subs r0, #0x40
	cmp r1, r0
	bne _0800F63A
	b _0800F740
_0800F63A:
	ldr r3, _0800F668 @ =0x00000121
	cmp r1, r3
	bne _0800F642
	b _0800F740
_0800F642:
	movs r2, #0x90
	lsls r2, r2, #1
	cmp r1, r2
	beq _0800F740
	ldr r5, _0800F664 @ =0xFFFFFEBE
	adds r0, r1, r5
	b _0800F69C
	.align 2, 0
_0800F650: .4byte gUnknown_08499590
_0800F654: .4byte gUnknown_08488954
_0800F658: .4byte 0x0000417A
_0800F65C: .4byte gUnknown_0848894C
_0800F660: .4byte 0x00000A22
_0800F664: .4byte 0xFFFFFEBE
_0800F668: .4byte 0x00000121
_0800F66C:
	cmp r6, #1
	bne _0800F6CC
	ldr r2, _0800F6B8 @ =0xFFFFFEBF
	adds r0, r1, r2
	cmp r0, #1
	bls _0800F740
	ldr r0, _0800F6BC @ =0x00000161
	cmp r1, r0
	beq _0800F740
	adds r0, #1
	cmp r1, r0
	beq _0800F740
	subs r0, #0x40
	cmp r1, r0
	beq _0800F740
	ldr r3, _0800F6C0 @ =0x00000121
	cmp r1, r3
	beq _0800F740
	movs r2, #0x90
	lsls r2, r2, #1
	cmp r1, r2
	beq _0800F740
	ldr r4, _0800F6C4 @ =0xFFFFFEBE
	adds r0, r1, r4
_0800F69C:
	cmp r0, #1
	bls _0800F768
	cmp r1, r3
	beq _0800F768
	cmp r1, r2
	beq _0800F768
	ldr r0, _0800F6C8 @ =0x00000103
	cmp r1, r0
	beq _0800F768
	subs r0, #1
	cmp r1, r0
	bne _0800F76A
	b _0800F768
	.align 2, 0
_0800F6B8: .4byte 0xFFFFFEBF
_0800F6BC: .4byte 0x00000161
_0800F6C0: .4byte 0x00000121
_0800F6C4: .4byte 0xFFFFFEBE
_0800F6C8: .4byte 0x00000103
_0800F6CC:
	cmp r6, #2
	bne _0800F710
	ldr r0, _0800F704 @ =0x00000143
	cmp r1, r0
	beq _0800F740
	subs r0, #3
	cmp r1, r0
	beq _0800F740
	adds r0, #1
	cmp r1, r0
	beq _0800F740
	adds r0, #0x22
	cmp r1, r0
	beq _0800F740
	subs r0, #0x40
	cmp r1, r0
	beq _0800F740
	ldr r3, _0800F708 @ =0x00000103
	cmp r1, r3
	beq _0800F740
	movs r2, #0x81
	lsls r2, r2, #1
	cmp r1, r2
	beq _0800F740
	ldr r5, _0800F70C @ =0xFFFFFEBE
	adds r0, r1, r5
	b _0800F750
	.align 2, 0
_0800F704: .4byte 0x00000143
_0800F708: .4byte 0x00000103
_0800F70C: .4byte 0xFFFFFEBE
_0800F710:
	cmp r6, #3
	bne _0800F76A
	ldr r0, _0800F744 @ =0x00000143
	cmp r1, r0
	beq _0800F740
	adds r0, #0x1d
	cmp r1, r0
	beq _0800F740
	adds r0, #1
	cmp r1, r0
	beq _0800F740
	adds r0, #2
	cmp r1, r0
	beq _0800F740
	subs r0, #0x40
	cmp r1, r0
	beq _0800F740
	ldr r3, _0800F748 @ =0x00000103
	cmp r1, r3
	beq _0800F740
	movs r2, #0x81
	lsls r2, r2, #1
	cmp r1, r2
	bne _0800F74C
_0800F740:
	movs r7, #2
	b _0800F76A
	.align 2, 0
_0800F744: .4byte 0x00000143
_0800F748: .4byte 0x00000103
_0800F74C:
	ldr r4, _0800F774 @ =0xFFFFFEBE
	adds r0, r1, r4
_0800F750:
	cmp r0, #1
	bls _0800F768
	ldr r0, _0800F778 @ =0x00000121
	cmp r1, r0
	beq _0800F768
	subs r0, #1
	cmp r1, r0
	beq _0800F768
	cmp r1, r3
	beq _0800F768
	cmp r1, r2
	bne _0800F76A
_0800F768:
	movs r7, #3
_0800F76A:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800F774: .4byte 0xFFFFFEBE
_0800F778: .4byte 0x00000121

