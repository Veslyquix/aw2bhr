	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040B08
sub_08040B08: @ 0x08040B08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	ldr r0, _08040BAC @ =gUnknown_08121870
	movs r1, #0
	movs r2, #1
	bl sub_0801C210
	mov r1, sl
	str r0, [r1, #0x30]
	movs r1, #1
	bl sub_0801C4D4
	mov r2, sl
	ldr r1, [r2, #0x30]
	movs r7, #0
	ldr r0, _08040BB0 @ =0x000031CA
	strh r0, [r1, #0x22]
	ldr r4, _08040BB4 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	mov sb, r1
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	mov r0, sb
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r4, [r4, r1]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	movs r2, #0x4c
	add sl, r2
	mov r0, sl
	strh r7, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040BAC: .4byte gUnknown_08121870
_08040BB0: .4byte 0x000031CA
_08040BB4: .4byte gSinLut

