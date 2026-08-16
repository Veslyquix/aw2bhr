	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005964
sub_08005964: @ 0x08005964
	push {r4, lr}
	sub sp, #4
	movs r0, #0x70
	bl sub_0801B780
	ldr r3, _08005988 @ =gUnknown_08488514
	ldr r0, _0800598C @ =gUnknown_0808D7C4
	ldr r1, [r0]
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r4, r0, #0
	cmp r1, #0
	blt _08005990
	adds r0, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _08005992
	.align 2, 0
_08005988: .4byte gUnknown_08488514
_0800598C: .4byte gUnknown_0808D7C4
_08005990:
	movs r0, #0
_08005992:
	str r0, [sp]
	adds r0, r3, #0
	movs r1, #2
	movs r2, #6
	movs r3, #0
	bl sub_08019F2C
	bl sub_08005874
	ldr r0, [r4]
	ldr r1, [r0]
	movs r0, #4
	strh r0, [r1, #2]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

