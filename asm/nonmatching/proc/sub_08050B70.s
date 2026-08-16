	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08050B70
sub_08050B70: @ 0x08050B70
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	ldr r6, _08050C5C @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r6, r1]
	mov r4, sp
	mov r1, sp
	bl sub_0801566C
	ldr r2, _08050C60 @ =gUnknown_03001470
	movs r3, #0
	ldrsh r1, [r6, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x30
	adds r0, r0, r1
	ldr r5, _08050C64 @ =gUnknown_0300453C
	ldrh r1, [r5]
	str r1, [r0]
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r2, #0x34
	adds r0, r0, r2
	ldr r1, _08050C68 @ =gUnknown_0300451C
	mov r8, r1
	ldrh r1, [r1]
	str r1, [r0]
	ldrh r0, [r5]
	movs r1, #1
	eors r1, r0
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r4, #3]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	ldrb r1, [r4, #5]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4, #5]
	ldr r2, _08050C6C @ =gUnknown_020296B0
	ldrh r1, [r5]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	ldr r2, _08050C70 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	ldrh r2, [r4, #4]
	ldr r0, _08050C74 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	ldr r2, _08050C78 @ =gUnknown_0855239C
	ldrh r0, [r5]
	ldr r1, _08050C7C @ =gUnknown_0300450C
	lsls r0, r0, #1
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	movs r3, #0
	ldrsh r0, [r6, r3]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_08015608
	ldr r4, _08050C80 @ =gUnknown_085535B0
	ldr r3, _08050C84 @ =gUnknown_085D6A48
	ldr r2, _08050C88 @ =gUnknown_03004580
	ldrh r0, [r5]
	lsls r1, r0, #4
	adds r2, #2
	adds r1, r1, r2
	ldrh r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	ldrh r1, [r1, #4]
	lsls r1, r1, #2
	adds r1, r1, r4
	ldr r2, [r1]
	mov r3, r8
	ldrh r1, [r3]
	bl _call_via_r2
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050C5C: .4byte gUnknown_03001FBC
_08050C60: .4byte gUnknown_03001470
_08050C64: .4byte gUnknown_0300453C
_08050C68: .4byte gUnknown_0300451C
_08050C6C: .4byte gUnknown_020296B0
_08050C70: .4byte 0x000003FF
_08050C74: .4byte 0xFFFFFC00
_08050C78: .4byte gUnknown_0855239C
_08050C7C: .4byte gUnknown_0300450C
_08050C80: .4byte gUnknown_085535B0
_08050C84: .4byte gUnknown_085D6A48
_08050C88: .4byte gUnknown_03004580

