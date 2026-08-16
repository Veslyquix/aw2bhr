	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08088044
sub_08088044: @ 0x08088044
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0xa
	bl sub_08043B44
	adds r0, r4, #0
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	movs r0, #0x78
	str r0, [r4, #0x34]
	str r1, [r4, #0x38]
	adds r0, r4, #0
	adds r0, #0x52
	strh r1, [r0]
	subs r0, #4
	strh r1, [r0]
	str r1, [r4, #0x58]
	str r1, [r4, #0x5c]
	str r1, [r4, #0x60]
	str r1, [r4, #0x2c]
	str r1, [r4, #0x30]
	subs r0, #6
	strh r1, [r0]
	adds r2, r4, #0
	adds r2, #0x68
	movs r0, #4
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
	ldr r1, _080880B0 @ =gUnknown_03005978
	movs r2, #0
	adds r0, r1, #4
_0808808A:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0808808A
	movs r3, #0
	ldr r0, _080880B4 @ =gUnknown_085802C0
	ldr r1, _080880B8 @ =gUnknown_0200FC50
	movs r2, #0x9f
	lsls r2, r2, #2
	str r3, [sp]
	str r3, [sp, #4]
	str r4, [sp, #8]
	movs r3, #9
	bl sub_08073304
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080880B0: .4byte gUnknown_03005978
_080880B4: .4byte gUnknown_085802C0
_080880B8: .4byte gUnknown_0200FC50

