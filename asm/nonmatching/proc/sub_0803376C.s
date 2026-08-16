	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803376C
sub_0803376C: @ 0x0803376C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r0, _08033788 @ =0x007FFF80
	cmp r1, r0
	bls _0803378C
	movs r0, #1
	rsbs r0, r0, #0
	b _080337CA
	.align 2, 0
_08033788: .4byte 0x007FFF80
_0803378C:
	lsrs r0, r1, #7
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r4, #0x7f
	ands r4, r1
	cmp r4, #0
	beq _080337A2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080337A2:
	ldr r0, _080337D4 @ =gUnknown_0849BB08
	ldr r1, [sp, #0x18]
	bl Proc_StartBlocking
	adds r2, r0, #0
	str r7, [r2, #0x24]
	adds r0, #0x28
	movs r1, #0
	strb r6, [r0]
	mov r0, r8
	str r0, [r2, #0x20]
	movs r0, #0
	strh r5, [r2, #0x2a]
	adds r3, r2, #0
	adds r3, #0x2e
	strb r4, [r3]
	adds r3, #1
	strb r0, [r3]
	strh r1, [r2, #0x2c]
	movs r0, #0
_080337CA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080337D4: .4byte gUnknown_0849BB08

