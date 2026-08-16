	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A2F4
sub_0808A2F4: @ 0x0808A2F4
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r2, #0x82
	lsls r2, r2, #5
	movs r0, #1
	str r0, [sp]
	movs r0, #0xb0
	movs r1, #0xa0
	movs r3, #2
	bl sub_08043C28
	ldr r1, _0808A338 @ =gUnknown_03005958
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, #0x3e
	movs r1, #0
	str r1, [sp]
	movs r1, #0x20
	movs r2, #0x78
	movs r3, #0
	bl sub_0801F34C
	ldr r2, _0808A33C @ =0x0000A2CC
	movs r0, #0x30
	movs r1, #0x78
	movs r3, #3
	bl sub_08043B60
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A338: .4byte gUnknown_03005958
_0808A33C: .4byte 0x0000A2CC

