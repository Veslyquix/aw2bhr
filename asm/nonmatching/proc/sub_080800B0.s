	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080800B0
sub_080800B0: @ 0x080800B0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r2, _0808016C @ =gUnknown_030030A4
	ldrb r1, [r2]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r6, _08080170 @ =gUnknown_03002B6C
	ldrb r0, [r6, #1]
	movs r2, #0x20
	rsbs r2, r2, #0
	adds r3, r2, #0
	ands r3, r0
	movs r0, #0xe
	orrs r3, r0
	ldr r5, _08080174 @ =gUnknown_030030B4
	ldrb r0, [r5, #1]
	ands r2, r0
	movs r0, #0x1a
	orrs r2, r0
	ldrb r4, [r6]
	movs r1, #0xd
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r4
	strb r0, [r6]
	ldrb r0, [r5]
	ands r1, r0
	strb r1, [r5]
	movs r1, #0x3f
	ands r3, r1
	movs r0, #0x40
	orrs r3, r0
	strb r3, [r6, #1]
	ands r2, r1
	orrs r2, r0
	strb r2, [r5, #1]
	ldr r0, _08080178 @ =gUnknown_08235558
	ldr r1, [r6]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r2, _0808017C @ =0x06000020
	adds r1, r1, r2
	bl sub_08011CAC
	ldr r0, _08080180 @ =gUnknown_082352FC
	ldr r4, _08080184 @ =gUnknown_0200FC50
	adds r1, r4, #0
	bl sub_08011CAC
	movs r1, #0x80
	lsls r1, r1, #4
	ldr r2, _08080188 @ =0x00009001
	adds r0, r4, #0
	bl sub_08012B00
	ldr r0, _0808018C @ =gUnknown_08235D10
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _08080190 @ =sub_080801A8
	bl sub_08011AAC
	ldr r1, _08080194 @ =gUnknown_03001FF8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08080198 @ =gUnknown_03001418
	ldr r3, _0808019C @ =0x0000FFF0
	adds r2, r3, #0
	strh r2, [r0]
	ldr r1, _080801A0 @ =gUnknown_030030A0
	subs r3, #0xf0
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _080801A4 @ =gUnknown_03001400
	strh r2, [r0]
	movs r0, #0x4c
	add r8, r0
	movs r0, #0
	mov r1, r8
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808016C: .4byte gUnknown_030030A4
_08080170: .4byte gUnknown_03002B6C
_08080174: .4byte gUnknown_030030B4
_08080178: .4byte gUnknown_08235558
_0808017C: .4byte 0x06000020
_08080180: .4byte gUnknown_082352FC
_08080184: .4byte gUnknown_0200FC50
_08080188: .4byte 0x00009001
_0808018C: .4byte gUnknown_08235D10
_08080190: .4byte sub_080801A8
_08080194: .4byte gUnknown_03001FF8
_08080198: .4byte gUnknown_03001418
_0808019C: .4byte 0x0000FFF0
_080801A0: .4byte gUnknown_030030A0
_080801A4: .4byte gUnknown_03001400

