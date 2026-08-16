	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08016824
sub_08016824: @ 0x08016824
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	bl sub_0801DAB0
	adds r4, r0, #0
	ldr r2, _080168B4 @ =gUnknown_0200E438
	ldr r1, _080168B8 @ =gUnknown_03001470
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrh r1, [r0, #0x26]
	movs r0, #0x4c
	muls r0, r1, r0
	adds r0, r0, r2
	strh r4, [r0, #0x3a]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov r6, sp
	adds r0, r5, #0
	mov r1, sp
	bl sub_0801566C
	ldrb r0, [r6, #1]
	movs r3, #1
	orrs r0, r3
	strb r0, [r6, #1]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	movs r0, #7
	ands r0, r4
	lsls r0, r0, #1
	ldrb r2, [r6, #3]
	movs r1, #0xf
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	movs r0, #8
	ands r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1b
	ands r0, r3
	lsls r0, r0, #4
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r0
	movs r0, #0x10
	ands r0, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	ands r0, r3
	lsls r0, r0, #5
	subs r2, #0x10
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, #3]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl sub_08015608
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080168B4: .4byte gUnknown_0200E438
_080168B8: .4byte gUnknown_03001470

