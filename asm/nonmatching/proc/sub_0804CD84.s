	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804CD84
sub_0804CD84: @ 0x0804CD84
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	ldr r3, _0804CE14 @ =gUnknown_03001470
	ldr r6, _0804CE18 @ =gUnknown_03001FBC
	movs r0, #0
	ldrsh r2, [r6, r0]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #5
	adds r0, r3, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrh r5, [r0]
	adds r3, #0x34
	adds r1, r1, r3
	ldrh r4, [r1]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0804DC5C
	movs r1, #0
	ldrsh r0, [r6, r1]
	mov r8, sp
	mov r1, sp
	bl sub_0801566C
	ldr r1, _0804CE1C @ =gUnknown_020298E0
	lsls r4, r4, #1
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r4, r4, r0
	adds r0, r1, #0
	adds r0, #0x26
	adds r0, r4, r0
	adds r1, #0x30
	adds r4, r4, r1
	ldrh r1, [r4]
	ldrh r0, [r0]
	adds r1, r1, r0
	ldr r2, _0804CE20 @ =gUnknown_08553B40
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #4
	mov r0, r8
	ldrb r2, [r0, #5]
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	mov r1, r8
	strb r0, [r1, #5]
	movs r1, #0
	ldrsh r0, [r6, r1]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804CE14: .4byte gUnknown_03001470
_0804CE18: .4byte gUnknown_03001FBC
_0804CE1C: .4byte gUnknown_020298E0
_0804CE20: .4byte gUnknown_08553B40

