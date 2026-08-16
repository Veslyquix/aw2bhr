	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085244
sub_08085244: @ 0x08085244
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x67
	movs r1, #0xbd
	movs r2, #0x98
	movs r3, #0
	bl sub_0801F34C
	adds r0, r4, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r4, #0
	bl sub_08085708
	bl sub_080853B0
	ldr r2, _0808528C @ =0x000082AC
	movs r0, #0x78
	movs r1, #8
	movs r3, #3
	bl sub_08043B60
	ldr r0, _08085290 @ =0x000010D0
	ldr r2, _08085294 @ =0x000062B8
	movs r1, #0x18
	movs r3, #5
	bl sub_0804402C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808528C: .4byte 0x000082AC
_08085290: .4byte 0x000010D0
_08085294: .4byte 0x000062B8

