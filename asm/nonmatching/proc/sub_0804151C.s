	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804151C
sub_0804151C: @ 0x0804151C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	movs r0, #0
	mov sb, r0
	ldr r0, _08041544 @ =gUnknown_03003F20
	ldr r5, [r0]
	ldr r0, _08041548 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0804154C
	movs r0, #0
	b _080415C8
	.align 2, 0
_08041544: .4byte gUnknown_03003F20
_08041548: .4byte gUnknown_030040D8
_0804154C:
	movs r7, #0
	ldr r1, _080415D8 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp sb, r0
	bge _080415C2
	adds r3, r1, #0
_0804155A:
	movs r4, #0
	ldr r0, [r3]
	adds r1, r7, #1
	mov r8, r1
	ldrh r0, [r0]
	cmp r4, r0
	bge _080415B8
	ldr r1, _080415DC @ =gUnknown_03003340
	lsls r0, r7, #2
	adds r6, r0, r1
	lsls r2, r7, #0x10
_08041570:
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _080415AE
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	asrs r1, r2, #0x10
	str r2, [sp]
	str r3, [sp, #4]
	bl sub_0804236C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	ldr r3, [sp, #4]
	cmp r0, #1
	bne _080415AE
	movs r0, #1
	add sb, r0
	strb r4, [r5]
	strb r7, [r5, #1]
	ldr r0, [r6]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #2]
	adds r5, #4
_080415AE:
	adds r4, #1
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r4, r0
	blt _08041570
_080415B8:
	mov r7, r8
	ldr r0, [r3]
	ldrh r0, [r0, #2]
	cmp r7, r0
	blt _0804155A
_080415C2:
	ldr r0, _080415E0 @ =0x0000FFFF
	strh r0, [r5, #2]
	mov r0, sb
_080415C8:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080415D8: .4byte gUnknown_08499590
_080415DC: .4byte gUnknown_03003340
_080415E0: .4byte 0x0000FFFF

