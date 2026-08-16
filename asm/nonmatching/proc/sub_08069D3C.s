	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08069D3C
sub_08069D3C: @ 0x08069D3C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r3, _08069DC8 @ =gDispIo
	ldrb r1, [r3, #1]
	movs r2, #0x20
	mov sb, r2
	mov r2, sb
	orrs r1, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #0x7f
	ands r1, r2
	strb r1, [r3, #1]
	ldr r4, _08069DCC @ =gUnknown_030030A4
	ldrb r1, [r4]
	movs r2, #1
	mov r8, r2
	mov r2, r8
	orrs r1, r2
	movs r6, #2
	orrs r1, r6
	movs r2, #5
	rsbs r2, r2, #0
	ands r1, r2
	movs r5, #8
	orrs r1, r5
	movs r3, #0x10
	orrs r1, r3
	strb r1, [r4]
	ldr r4, _08069DD0 @ =gUnknown_030030DC
	ldrb r2, [r4]
	mov r1, r8
	orrs r2, r1
	orrs r2, r6
	movs r1, #4
	orrs r2, r1
	orrs r2, r5
	orrs r2, r3
	strb r2, [r4]
	ldr r3, _08069DD4 @ =gUnknown_03002B40
	ldr r5, _08069DD8 @ =gUnknown_08581478
	lsls r1, r0, #2
	adds r1, r1, r5
	ldrh r1, [r1]
	strb r1, [r3]
	ldr r3, _08069DDC @ =gUnknown_03002EFC
	movs r1, #0
	strb r1, [r3]
	ldr r1, _08069DE0 @ =gUnknown_03002B4C
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r1, _08069DE4 @ =gUnknown_03002B44
	movs r0, #0xa0
	strb r0, [r1]
	mov r0, sb
	orrs r2, r0
	strb r2, [r4]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08069DC8: .4byte gDispIo
_08069DCC: .4byte gUnknown_030030A4
_08069DD0: .4byte gUnknown_030030DC
_08069DD4: .4byte gUnknown_03002B40
_08069DD8: .4byte gUnknown_08581478
_08069DDC: .4byte gUnknown_03002EFC
_08069DE0: .4byte gUnknown_03002B4C
_08069DE4: .4byte gUnknown_03002B44

