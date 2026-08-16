	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080376DC
sub_080376DC: @ 0x080376DC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r7, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _08037744 @ =gUnknown_0300057C
	str r4, [r0]
	ldr r0, _08037748 @ =gUnknown_081253F0
	lsls r1, r4, #0x15
	lsrs r1, r1, #0x10
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _0803774C @ =0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	adds r6, r6, r0
	adds r0, r6, #0
	bl sub_0801B6EC
	adds r0, r6, #0
	bl sub_0801B6FC
	mov r0, r8
	mov r1, sb
	adds r2, r7, #0
	bl sub_08013D00
	lsls r4, r4, #0xc
	orrs r4, r5
	adds r1, r4, #0
	bl sub_08037A20
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	bl sub_08013AD4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037744: .4byte gUnknown_0300057C
_08037748: .4byte gUnknown_081253F0
_0803774C: .4byte 0x000003FF

