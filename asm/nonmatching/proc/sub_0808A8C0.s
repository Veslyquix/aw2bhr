	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A8C0
sub_0808A8C0: @ 0x0808A8C0
	push {r4, r5, lr}
	ldr r4, _0808A950 @ =gUnknown_030030E0
	ldrb r2, [r4]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r4]
	ldr r2, _0808A954 @ =gUnknown_03002020
	movs r1, #0x10
	strh r1, [r2]
	ldr r2, _0808A958 @ =gUnknown_03002B28
	movs r1, #4
	strh r1, [r2]
	ldr r2, _0808A95C @ =gUnknown_03001FFC
	movs r1, #0
	strh r1, [r2]
	ldrh r2, [r4]
	ldr r1, _0808A960 @ =0x0000FFE0
	ands r1, r2
	movs r2, #8
	orrs r1, r2
	strh r1, [r4]
	ldrb r2, [r4]
	movs r3, #0x21
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r1, r2
	strb r1, [r4]
	ldrh r2, [r4]
	ldr r1, _0808A964 @ =0x0000E0FF
	ands r1, r2
	movs r5, #0x80
	lsls r5, r5, #5
	adds r2, r5, #0
	orrs r1, r2
	strh r1, [r4]
	ldrb r1, [r4, #1]
	ands r3, r1
	strb r3, [r4, #1]
	ldr r4, _0808A968 @ =gUnknown_03002B6C
	ldrb r2, [r4]
	movs r3, #4
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r1, r2
	strb r1, [r4]
	ldr r4, _0808A96C @ =gUnknown_03001FE8
	ldrb r2, [r4]
	adds r1, r3, #0
	ands r1, r2
	movs r2, #2
	orrs r1, r2
	strb r1, [r4]
	ldr r4, _0808A970 @ =gUnknown_030030B4
	ldrb r1, [r4]
	movs r2, #3
	orrs r1, r2
	strb r1, [r4]
	ldr r2, _0808A974 @ =gUnknown_0300251C
	ldrb r1, [r2]
	ands r3, r1
	movs r1, #1
	orrs r3, r1
	strb r3, [r2]
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A950: .4byte gUnknown_030030E0
_0808A954: .4byte gUnknown_03002020
_0808A958: .4byte gUnknown_03002B28
_0808A95C: .4byte gUnknown_03001FFC
_0808A960: .4byte 0x0000FFE0
_0808A964: .4byte 0x0000E0FF
_0808A968: .4byte gUnknown_03002B6C
_0808A96C: .4byte gUnknown_03001FE8
_0808A970: .4byte gUnknown_030030B4
_0808A974: .4byte gUnknown_0300251C

