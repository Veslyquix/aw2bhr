	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087248
sub_08087248: @ 0x08087248
	ldr r0, _08087268 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08087270
	ldr r0, _0808726C @ =gUnknown_03005918
	ldr r0, [r0]
	lsls r2, r0, #2
	asrs r1, r2, #1
	adds r0, r1, #0
	adds r0, #0xab
	cmp r0, #0xf0
	bgt _0808728C
	adds r0, r1, #0
	subs r0, #0xab
	b _08087290
	.align 2, 0
_08087268: .4byte gUnknown_03003FC0
_0808726C: .4byte gUnknown_03005918
_08087270:
	ldr r0, _08087288 @ =gUnknown_03005918
	ldr r0, [r0]
	lsls r2, r0, #2
	asrs r1, r2, #1
	adds r0, r1, #0
	adds r0, #0xa3
	cmp r0, #0xf0
	bgt _0808728C
	adds r0, r1, #0
	subs r0, #0xa3
	b _08087290
	.align 2, 0
_08087288: .4byte gUnknown_03005918
_0808728C:
	adds r0, r2, #0
	subs r0, #0xf0
_08087290:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0

