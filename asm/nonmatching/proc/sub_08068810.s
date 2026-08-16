	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08068810
sub_08068810: @ 0x08068810
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov sb, r1
	mov sl, r2
	mov r8, r3
	ldr r5, [sp, #0x20]
	ldr r4, [sp, #0x24]
	ldr r1, [sp, #0x28]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08068898 @ =gUnknown_08581264
	bl Proc_Start
	adds r7, r0, #0
	adds r0, #0x29
	strb r6, [r0]
	strh r5, [r7, #0x30]
	adds r0, #9
	strb r4, [r0]
	ldr r0, _0806889C @ =gUnknown_0817DA18
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl sub_08013618
	ldr r2, _080688A0 @ =gUnknown_08610A38
	ldr r1, _080688A4 @ =gUnknown_085D3DD0
	lsls r0, r6, #6
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r1, r5, #0
	bl sub_08068038
	adds r1, r7, #0
	adds r1, #0x2a
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x38
	mov r1, sb
	strb r1, [r0]
	adds r0, #1
	mov r1, sl
	strb r1, [r0]
	adds r0, #0x15
	mov r1, r8
	strb r1, [r0]
	adds r0, #1
	movs r1, #0
	strb r1, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068898: .4byte gUnknown_08581264
_0806889C: .4byte gUnknown_0817DA18
_080688A0: .4byte gUnknown_08610A38
_080688A4: .4byte gUnknown_085D3DD0

