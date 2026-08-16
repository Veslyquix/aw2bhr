	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080057EC
sub_080057EC: @ 0x080057EC
	push {r4, lr}
	sub sp, #4
	ldr r3, _0800580C @ =gUnknown_08488494
	ldr r0, _08005810 @ =gUnknown_0808D7BC
	ldr r1, [r0]
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r4, r0, #0
	cmp r1, #0
	blt _08005814
	adds r0, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _08005816
	.align 2, 0
_0800580C: .4byte gUnknown_08488494
_08005810: .4byte gUnknown_0808D7BC
_08005814:
	movs r0, #0
_08005816:
	str r0, [sp]
	adds r0, r3, #0
	movs r1, #2
	movs r2, #4
	movs r3, #0
	bl sub_08019F2C
	bl sub_0800572C
	ldr r0, [r4]
	ldr r1, [r0]
	movs r0, #3
	strh r0, [r1, #2]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

